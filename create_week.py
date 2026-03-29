#!/usr/bin/env python3
import os
import re
import random
import json
import sys
import urllib.request
import urllib.error
from datetime import datetime, timedelta

STUDY_DIR = os.path.dirname(os.path.abspath(__file__))

def get_used_problem_ids():
    used = set()
    for folder in os.listdir(STUDY_DIR):
        readme = os.path.join(STUDY_DIR, folder, "README.md")
        if not os.path.isfile(readme):
            continue
        with open(readme) as f:
            for line in f:
                match = re.match(r'\|\s*\[(\d+)\]', line)
                if match:
                    used.add(int(match.group(1)))
    return used

def get_week_number():
    week_nums = []
    for folder in os.listdir(STUDY_DIR):
        readme = os.path.join(STUDY_DIR, folder, "README.md")
        if not os.path.isfile(readme):
            continue
        with open(readme) as f:
            first_line = f.readline()
            match = re.search(r'Week#(\d+)', first_line)
            if match:
                week_nums.append(int(match.group(1)))
    return max(week_nums) + 1 if week_nums else 1

def fetch_leetcode_problems():
    url = "https://leetcode.com/graphql"
    query = """
    query problemsetQuestionList($limit: Int, $skip: Int, $filters: QuestionListFilterInput) {
      problemsetQuestionList: questionList(
        categorySlug: ""
        limit: $limit
        skip: $skip
        filters: $filters
      ) {
        total: totalNum
        questions: data {
          frontendQuestionId: questionFrontendId
          title
          titleSlug
          difficulty
          acRate
        }
      }
    }
    """

    all_questions = []
    skip = 0
    limit = 100

    while True:
        payload = json.dumps({
            "query": query,
            "variables": {
                "limit": limit,
                "skip": skip,
                "filters": {}
            }
        }).encode("utf-8")

        req = urllib.request.Request(
            url,
            data=payload,
            headers={
                "Content-Type": "application/json",
                "User-Agent": "Mozilla/5.0",
                "Referer": "https://leetcode.com/problemset/",
            }
        )

        try:
            with urllib.request.urlopen(req, timeout=10) as resp:
                data = json.loads(resp.read())
        except urllib.error.URLError as e:
            print(f"API 요청 실패: {e}")
            return []

        questions = data["data"]["problemsetQuestionList"]["questions"]
        total = data["data"]["problemsetQuestionList"]["total"]
        all_questions.extend(questions)

        print(f"  {len(all_questions)}/{total} 가져옴...")
        if len(all_questions) >= total:
            break
        skip += limit

    return all_questions

def pick_problems(questions, used_ids, count=3):
    candidates = [
        q for q in questions
        if q["difficulty"] in ("Easy", "Medium")
        and int(q["frontendQuestionId"]) not in used_ids
        and q["frontendQuestionId"].isdigit()
    ]
    if len(candidates) < count:
        count = len(candidates)
    return random.sample(candidates, count)

def create_week_folder(week_num, problems, base_date=None):
    if base_date is None:
        base_date = datetime.today()
    target_date = base_date + timedelta(days=7)
    folder_name = target_date.strftime("%Y%m%d")
    folder_path = os.path.join(STUDY_DIR, folder_name)

    if os.path.exists(folder_path):
        print(f"폴더 이미 존재함: {folder_name}")
    else:
        os.makedirs(folder_path)
        print(f"폴더 생성: {folder_name}")

    rows = ""
    for q in problems:
        num = q["frontendQuestionId"]
        title = q["title"]
        slug = q["titleSlug"]
        difficulty = q["difficulty"]
        url = f"https://leetcode.com/problems/{slug}/"
        rows += f'| [{num}]({url}) | {title} | % | {difficulty} |\n'

    readme_content = f"""### Week#{week_num}

| #                                                                                                           | Title | Acceptance | Difficulty
|:------------------------------------------------------------------------------------------------------------|:---------------:|:----------:|-----------:|
{rows}
"""

    readme_path = os.path.join(folder_path, "README.md")
    with open(readme_path, "w") as f:
        f.write(readme_content)

    print(f"README 생성 완료: {folder_path}/README.md")
    print(f"\n=== Week#{week_num} ({folder_name}) ===")
    for q in problems:
        print(f"  #{q['frontendQuestionId']} {q['title']} [{q['difficulty']}]")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        base_date = datetime.strptime(sys.argv[1], "%Y%m%d")
    else:
        base_date = datetime.today()

    used_ids = get_used_problem_ids()

    week_num = get_week_number()

    questions = fetch_leetcode_problems()
    if not questions:
        exit(1)

    picked = pick_problems(questions, used_ids)
    create_week_folder(week_num, picked, base_date)

class Solution:
    def is_same(self, a, b):
            if (a is None and b is not None) or (a is not None and b is None): #한쪽만 none 이면 false
                return False
            elif a is None and b is None: #둘다 none 이여도 같음
                return True
            
            # a.val is b.val 은 같은 오브젝트를 참조하는지 체크
            if a.val == b.val and self.is_same(a.left, b.left) and self.is_same(a.right, b.right):
                return True
            else: 
                return False

    def isSubtree(self, root: Optional[TreeNode], subRoot: Optional[TreeNode]) -> bool:
        # 현재 depth의 트리끼리 비교
        if self.is_same(root, subRoot):
            return True

        # 예외 처리가 좀 더러운데.. 둘다 none 일땐 위에서 True 떨어지고, 여긴 subRoot 만 none 이니까 False
        if root is None:
            return False

        # 다음 뎁스
        return self.isSubtree(root.left, subRoot) or self.isSubtree(root.right, subRoot)
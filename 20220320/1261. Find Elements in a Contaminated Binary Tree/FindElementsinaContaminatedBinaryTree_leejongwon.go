/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
type FindElements struct {
    root *TreeNode
}


func Constructor(root *TreeNode) FindElements {
    if root != nil {
		root.Val = 0
		build(root)
	}

	return FindElements {
        root: root,
    }
}

func build(root *TreeNode) {
    if root != nil {
		if root.Left != nil {
            root.Left.Val = (root.Val) * 2 + 1
            build(root.Left)
		}
		if root.Right != nil {
            root.Right.Val = (root.Val) * 2 + 2
            build(root.Right)
		}
	}
}


func (this *FindElements) Find(target int) bool {
    var path []int
    remain := target

    left := 0;
    right := 1;

    for remain > 0 {
        if remain % 2 != 0 {
            remain = (remain - 1) / 2
            path = append(path, left)
        } else {
            remain = (remain - 2) / 2
            path = append(path, right)
        }
    }

    cursor := this.root

    for i := len(path) - 1; i >= 0; i-- {
        if path[i] == left {
            if cursor.Left == nil {
                return false
            }
            cursor = cursor.Left
        } else {
            if cursor.Right == nil {
                return false
            }
            cursor = cursor.Right
        }
    }

    return true
}

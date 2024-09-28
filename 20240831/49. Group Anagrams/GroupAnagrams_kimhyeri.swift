class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var group = [String: [String]]()

        for i in strs {
            let sortedString = i.sorted()
            if var groupList = group[String(sortedString)] {
                groupList.append(i)
                group[String(sortedString)] = groupList
            } else {
                group[String(sortedString)] = [i]
            }
        }

        return group.values.map { $0 }
    }
}


func createHorizontalDividerAttribute(attribute: UICollectionViewLayoutAttributes, totalCount: Int, maxCellHeight: CGFloat) -> {
    
    let horizontalDividerAttribute = UICollectionViewLayoutAttributes(forDecorationViewOfKind: Const.horizontalDivider, with: attribute.indexPath)
    let width = attribute.frame.width + ((attribute.indexPath.row + 1 < totalCount - totalCount % rowCount) ? minimumLineSpacing : 0)
    horizontalDividerAttribute.frame = CGRect(x: attribute.frame.origin.x, y: attribute.frame.origin.y + maxCellHeight + (minimumLineSpacing / 2) + (Const.dividerHeight / 2), width: width, height: Const.dividerHeight)
    return horizontalDividerAttribute
}

attributes
    .filter{$0.repersentedElementCategory == .cell}
    .forEach {
        var frame = $0.frame
        frame.origin = topOffset + (maxCellHeight + rowSpacing) * Double(currentRowCount)
        currentRowCount = (currentRowCount + 1) % rowCount
        $0.frame = frame
    
}

let horizontalDecorationAttributes = attributes
    .filter({$0.indexPath.row + 1 % rowCount != 0})
    .map {
        createHorizontalDividerAttribute(attribute: $0,
                                         totalCount: attributes.count,
                                         maxCellHeight: maxCellHeight)
    }

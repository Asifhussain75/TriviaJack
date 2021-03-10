//
//  UITableView+Extension.swift
//  TriviaJack
//
//  Created by Mobilecoderz5 on 15/01/21.
//  Copyright © 2021 mobilecoderz. All rights reserved.
//


import UIKit

extension UITableView{
    func indexPathForView(_ view: UIView) -> IndexPath? {
        let center = view.center
        let viewCenter = convert(center, from: view.superview)
        let indexPath = indexPathForRow(at: viewCenter)
        return indexPath
    }
    func registerReusableCell<Cell: Reusable>(_ cell: Cell.Type){
        let ni = UINib(nibName: Cell.nib, bundle:  Bundle(for: cell))
        self.register(ni, forCellReuseIdentifier: cell.reuseIdentifier)
    }
    
    func dequeueReusableCell<Cell:Reusable>(_ cell: Cell.Type,for indexPath: IndexPath)-> Cell {
        return self.dequeueReusableCell(withIdentifier: cell.reuseIdentifier, for: indexPath) as! Cell
    }
    
    func registerReusableHeaderFooterCell<Cell: Reusable>(_ cell: Cell.Type){
        let nib = UINib(nibName: Cell.nib, bundle:  Bundle(for: cell))
        self.register(nib, forHeaderFooterViewReuseIdentifier: cell.reuseIdentifier)
    }
    
    func dequeueReusableHeaderFooterCell<Cell:Reusable>(_ cell: Cell.Type)-> Cell {
        return self.dequeueReusableHeaderFooterView(withIdentifier: cell.reuseIdentifier) as! Cell
    }
}

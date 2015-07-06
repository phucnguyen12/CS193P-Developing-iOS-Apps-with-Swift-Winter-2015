//
//  GraphViewController.swift
//  Calculator
//
//  Created by Phuc Nguyen on 7/6/15.
//  Copyright (c) 2015 m2m server software gmbh. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, GraphViewDataSource {
    
    private var brain = CalculatorBrain()
    typealias PropertyList = AnyObject
    var program: PropertyList {
        get{
            return brain.program
        }
        
        set {
            brain.program = newValue
        }
    }
    

    @IBOutlet weak var graphView: GraphView! {
        didSet {
            graphView.dataSource = self
        }
    }
    
    func y(x: CGFloat) -> CGFloat? {
        brain.variableValues["M"] = Double(x)
        if let y = brain.evaluate() {
            return CGFloat(y)
        }
        
        return nil
    }
  
}

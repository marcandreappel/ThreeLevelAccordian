//
//  ViewController.swift
//  FunAccordionViewExample
//
//  Created by Marc-André Appel on 28/12/2018.
//  Copyright (c) 2018 Marc-André Appel. All rights reserved.
//

import UIKit
import FunAccordionView

class ViewController: UIViewController, FunAVDelegate, UIActionSheetDelegate {

    @IBOutlet weak var tableView: UITableView!

    var cells = [FunAVCell]()
    var delegateController: FunAVController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Checklist"

        let backgroundColor = UIColor(red: 237.0 / 255.0, green: 254.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
        let textColor = UIColor(red: 31.0 / 255.0, green: 217.0 / 255.0, blue: 185.0 / 255.0, alpha: 1.0)

        cells.append(FunAVHeaderCell(value: "Bathroom" as AnyObject, image: "bathroom_grey_32.png", backgroundColor: UIColor.lightGray, textColor: UIColor.black))
        cells.append(FunAVCell(value: "Shower" as AnyObject))
        cells.append(FunAVSubCell(value: "Shower pores should be cleaned effectively by brushing." as AnyObject))
        cells.append(FunAVCell(value: "Tap" as AnyObject))
        cells.append(FunAVSubCell(value: "Taps must be washed with soap and all the salt removed." as AnyObject))
        cells.append(FunAVCell(value: "Toilet" as AnyObject, image: "toilet_grey_32.png"))
        cells.append(FunAVSubCell(value: "Should be made stains and germs free." as AnyObject))

        cells.append(FunAVHeaderCell(value: "Bedroom" as AnyObject, image: "bedroom_grey_32.png"))
        cells.append(FunAVCell(value: "Bed" as AnyObject))
        cells.append(FunAVSubCell(value: "Remove all the dust." as AnyObject))
        cells.append(FunAVCell(value: "Dressing" as AnyObject))

        cells.append(FunAVHeaderCell(value: "Kitchen" as AnyObject, image: "kitchen_grey_32.png"))
        cells.append(FunAVCell(value: "Utensils" as AnyObject))
        cells.append(FunAVSubCell(value: "There are many type of utensils like tongs, rolling pin, pan, non stick pans. Wash them all." as AnyObject))
        cells.append(FunAVCell(value: "Sink" as AnyObject))
        cells.append(FunAVSubCell(value: "Clean the sink" as AnyObject))

        cells.append(FunAVHeaderCell(value: "Hallway" as AnyObject, image: "hallway_grey_32.png"))
        cells.append(FunAVCell(value: "Stairs" as AnyObject, image: "stairs_grey_32.png"))
        cells.append(FunAVSubCell(value: "One stair, two stair, three stair, all stairs clean clean." as AnyObject))
        cells.append(FunAVCell(value: "Hall" as AnyObject))
        cells.append(FunAVSubCell(value: "Clean the hall" as AnyObject, image: "hall_grey_32.png"))

        cells.append(FunAVHeaderCell(value: "Lounge" as AnyObject, image: "lounge_grey_32.png"))
        cells.append(FunAVCell(value: "Dining Area" as AnyObject, image: "dining_area_grey_32.png"))
        cells.append(FunAVSubCell(value: "All tables and chairs scrubbed for dust and germs." as AnyObject))

        cells.append(FunAVHeaderCell(value: "Study Room" as AnyObject, image: "study_room_grey_32.png", backgroundColor: UIColor.green, textColor: UIColor.white))

        cells.append(FunAVHeaderCell(value: "Conservatory" as AnyObject, image: "conservatory_grey_32.png"))
        cells.append(FunAVCell(value: "Utilities" as AnyObject, image: "utility_room_grey_32.png"))
        cells.append(FunAVSubCell(value: "Clean! Clean!" as AnyObject))

        cells.append(FunAVHeaderCell(value: "Entrance" as AnyObject, image: "entrance_grey_32.png"))
        cells.append(FunAVCell(value: "Back Room" as AnyObject, image: "back_room_grey_32.png"))
        cells.append(FunAVSubCell(value: "Clean! Clean!" as AnyObject))

        let options: [FunAVOption] = [
            .useAccessoryIcons(true),
            .expandIcon(UIImage(named: "MyExpandIcon.png")!),
            .collapseIcon(UIImage(named: "MyCollapseIcon.png")!),
            .headerTextFont(UIFont.systemFont(ofSize: CGFloat(15.0))),
            .headerTextColor(textColor),
            .headerCellBackgroundColor(backgroundColor),
            .subItemTextFont(UIFont.systemFont(ofSize: CGFloat(12.0))),
            .subItemTextColor(UIColor.black),
            .subItemCellBackgroundColor(UIColor.white),
            .itemTextFont(UIFont.systemFont(ofSize: CGFloat(14.0))),
            .itemTextColor(UIColor.black),
            .itemCellBackgroundColor(UIColor.white),
        ]

        let funAccordionView = FunAccordionView.init(cells: cells, options: options, reuseIdentifier: "FunAVCell")
        funAccordionView.delegate = self

        delegateController = funAccordionView.controller
        tableView.dataSource = delegateController
        tableView.delegate = delegateController
        tableView.reloadData()
    }

    func didSelectItemAtIndex(_ index: Int) {
        print("Selected index: \(index)")
    }
}

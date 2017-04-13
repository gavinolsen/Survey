//
//  ResponseTableViewController.swift
//  Survey
//
//  Created by Gavin Olsen on 4/13/17.
//  Copyright © 2017 Gavin Olsen. All rights reserved.
//

import UIKit

class ResponseTableViewController: UITableViewController {
    
    var surveys: [Survey] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SurveyController.fetchResponses { (surveys) in
            self.surveys = surveys
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return surveys.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "surveyCell", for: indexPath)

        let survey = surveys[indexPath.row]
        
        cell.textLabel?.text = survey.name
        cell.detailTextLabel?.text = survey.lang

        return cell
    }
}

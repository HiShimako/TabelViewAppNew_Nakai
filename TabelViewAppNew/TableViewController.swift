//
//  TableViewController.swift
//  TabelViewAppNew
//
//  Created by user on 2023/08/29.
//

import UIKit

class TableViewController: UITableViewController {
    var taskArray: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
                   let userDefaults = UserDefaults.standard

                  //"add"というキーで保存された値がなにかある -> 値をtaskArrayへ
                  if userDefaults.object(forKey: "add") != nil {
                      taskArray = userDefaults.object(forKey: "add") as! [String]
                  }
                  //tableViewを更新
                  tableView.reloadData()
       }
        

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //表示するセルを定義
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //再利用するセルを設定
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameCell", for: indexPath)
        //セルのラベルに配列の中身を表示
        cell.textLabel?.text = taskArray[indexPath.row]
        

        // Configure the cell...

        
        return cell
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //taskArray内のindexPathのrow番目をremove(消去)する
            taskArray.remove(at:indexPath.row)
            //再びアプリ内に消去した配列を保存
            UserDefaults.standard.set(taskArray, forKey:"add")
            //tableViewを更新
            tableView.reloadData()
        }else if editingStyle == .insert {
/*
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
*/
  //tableViewを更新
  tableView.reloadData()
  } else if editingStyle == .insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
    
    }
    

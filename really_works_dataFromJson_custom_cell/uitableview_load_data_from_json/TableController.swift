//
//  TableController.swift
//  uitableview_load_data_from_json


import UIKit

class TableController: UITableViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    
    
    var arrayOfPersons: [Person] = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_data_from_url("http://mobile.tanggoal.com/comment/get_course_comments/1")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPersons.count
        
    }
    // 여시서 cell 짖거리
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       /* let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        
        cell.textLabel?.text = TableData2[indexPath.row]+"\n"+TableData[indexPath.row]
        
        
        return cell*/
        
        let cell : CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCell
        
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.purpleColor()
            
        }else{
            cell.backgroundColor = UIColor.orangeColor()
            
            
        }
        
        let person = arrayOfPersons[indexPath.row]
        
        cell.setCell(person.name, rightLabelInt: person.number, comment_text: person.commentText, imageName: person.imageName)
        
        return cell
        
    }
    
    
    func get_data_from_url(url:String)
    {
        let httpMethod = "GET"
        let timeout = 15
        let url = NSURL(string: url)
        let urlRequest = NSMutableURLRequest(URL: url!,
            cachePolicy: .ReloadIgnoringLocalAndRemoteCacheData,
            timeoutInterval: 15.0)
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(
            urlRequest,
            queue: queue,
            completionHandler: {(response: NSURLResponse!,
                data: NSData!,
                error: NSError!) in
                if data.length > 0 && error == nil{
                    let json = NSString(data: data, encoding: NSASCIIStringEncoding)
                    self.extract_json(json!)
                }else if data.length == 0 && error == nil{
                    println("Nothing was downloaded")
                } else if error != nil{
                    println("Error happened = \(error)")
                }
            }
        )
    }
    
    func extract_json(data:NSString)
    {
        var parseError: NSError?
        let jsonData:NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &parseError)
        if (parseError == nil)
        {
            if let countries_list = json as? NSArray
            {
                for (var i = 0; i < countries_list.count ; i++ )
                {
                    if let country_obj = countries_list[i] as? NSDictionary
                    {
                        if let user_name = country_obj["username"] as? String
                        {
                            if let comment_text = country_obj["comment_text"] as? String
                            {
                                
                                var person1 = Person(name: user_name, number:60, comment_text: comment_text, imageName: "sign1.png")
                                
                                
                                arrayOfPersons.append(person1)
                               
                            }
                        }
                    }
                }
            }
        }
        do_table_refresh();
    }
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
    }

}

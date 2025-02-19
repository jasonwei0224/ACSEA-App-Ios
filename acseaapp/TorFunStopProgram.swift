//
//  VanFunStopProgram.swift
//  acseaapp
//
//  Created by Jason on 2019-06-24.
//  Copyright © 2019 ACSEA. All rights reserved.
//

import UIKit

import FirebaseAuth
import Firebase
import FirebaseDatabase


class TorFunStopProgram: UIViewController {
    var torProgramCode = "0" ;
    var torProgramOneComplete = false;
    var torProgramTwoComplete = false;
    var torProgramThreeComplete = false;
    var torProgramFourComplete = false;
    var torProgramFiveComplete = false;
    var torProgramSixComplete = false;
    var torProgramSevenComplete = false;
    var torProgramEightComplete = false;
    var torProgramNineComplete = false;
    var torProgramTenComplete = false;
    var torProgramElevenComplete = false;
    
    let torProgramOneKey = "torprogramOneComplete"
    let torProgramTwoKey = "torprogramTwoComplete"
    let torProgramThreeKey = "torprogramThreeComplete"
    let torProgramFourKey = "torprogramFourComplete"
    let torProgramFiveKey = "torprogramFiveComplete"
    let torProgramSixKey = "torprogramSixComplete"
    let torProgramSevenKey = "torprogramSevenComplete"
    let torProgramEightKey = "torprogramEightComplete"
    let torProgramNineKey = "torprogramNineComplete"
    let torProgramTenKey = "torprogramTenComplete"
    let torProgramElevenKey = "torprogramElevenComplete"
    
    var torProgramOneText = "Glove Puppet\n(North Orchard)"
    let torProgramTwoText = "Let's Savour Taiwan\n(South Lawn)"
    let torProgramThreeText = "Taiwan Bookstore\n(West Corridor Bays)"
    let torProgramFourText = "Hope Talk\n(Studio Theatre)"
    let torProgramFiveText = "Island Scream Exhibition\n(Brigantine Room)"
    let torProgramSixText = "Fun Stop Station\n(Boulevard Pavillion)"
    //let torProgramSevenText =
    //let torProgramEightText = "Home Winds\n(MBCS)"
    //let torProgramNineText = "Island Scream Exhibition\n(Brigantine Room)"
    //let torProgramTenText = "Taiwan New DNA\n(Brigantine Patio)"
    //let torProgramElevenText = "Fun Stop Station\n(Boulevard Pavillion)"
    
    let torProgramOneImage = "taiwanhandpuppet.jpg"
    let torProgramTwoImage = "letssavourtaiwan.jpg"
    let torProgramThreeImage = "taiwanbookstorephoto.jpg"
    let torProgramFourImage = "torontohopetalk.png" // hope talk
    let torProgramFiveImage = "sorryyouthexhibition.jpg" //islandscream
    let torProgramSixImage = "funstopstation.png" // fun stop
    //let torProgramSevenImage = "torontohopetalk.png"
    //let torProgramEightImage = "torontohomewinds.png"
    //let torProgramNineImage = "sorryyouthexhibition.png"
    //let torProgramTenImage = "torontotaiwannewdna.png"
    //let torProgramElevenImage = "funstopstation.png"
    
    
    let torontoDefaults = UserDefaults.standard
    
    let segueID = "TorFunStopSegue"
    var funStopComplete = false;
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var torFunStopProgramList = [
            TorFunStopCellData.init(image: UIImage(named:torProgramOneImage), message: torProgramOneText),
            TorFunStopCellData.init(image: UIImage(named:torProgramTwoImage), message: torProgramTwoText),
            TorFunStopCellData.init(image: UIImage(named:torProgramThreeImage), message: torProgramThreeText),
            TorFunStopCellData.init(image: UIImage(named:torProgramFourImage), message: torProgramFourText),
            TorFunStopCellData.init(image: UIImage(named:torProgramFiveImage), message: torProgramFiveText),
            TorFunStopCellData.init(image: UIImage(named:torProgramSixImage), message: torProgramSixText),
            //TorFunStopCellData.init(image: UIImage(named:torProgramSevenImage), message: torProgramSevenText),
            //TorFunStopCellData.init(image: UIImage(named:torProgramEightImage), message: torProgramEightText),
            //TorFunStopCellData.init(image: UIImage(named:torProgramNineImage), message: torProgramNineText),
            //TorFunStopCellData.init(image: UIImage(named:torProgramTenImage), message: torProgramTenText),
            //TorFunStopCellData.init(image: UIImage(named:torProgramElevenImage), message: torProgramElevenText)
            
            ];
        
        
        torProgramOneComplete = (torontoDefaults.bool(forKey: torProgramOneKey))
        torProgramTwoComplete = (torontoDefaults.bool(forKey: torProgramTwoKey))
        torProgramThreeComplete = (torontoDefaults.bool(forKey: torProgramThreeKey))
        torProgramFourComplete = (torontoDefaults.bool(forKey: torProgramFourKey))
        torProgramFiveComplete = (torontoDefaults.bool(forKey: torProgramFiveKey))
        torProgramSixComplete = (torontoDefaults.bool(forKey: torProgramSixKey))
        //torProgramSevenComplete = (torontoDefaults.bool(forKey: torProgramSevenKey))
        //torProgramEightComplete = (torontoDefaults.bool(forKey: torProgramEightKey))
        //torProgramNineComplete = (torontoDefaults.bool(forKey: torProgramNineKey))
        //torProgramTenComplete = (torontoDefaults.bool(forKey: torProgramTenKey))
        //torProgramElevenComplete = (torontoDefaults.bool(forKey: torProgramElevenKey))
        if(segue.identifier == segueID){
            let table = segue.destination as! TorFunStopTableViewController
            table.data1 = torFunStopProgramList
        }
        
        
        if (torProgramOneComplete || torProgramCode == "1"){
            torFunStopProgramList[0] = TorFunStopCellData.init(image: UIImage(named: torProgramOneImage), message: "COMPLETE")
           // print("Step 1 complete")
            
            torProgramOneComplete = true;
            self.torontoDefaults.set(self.torProgramOneComplete, forKey: torProgramOneKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
                //print("Step Two Complete")
            }
        }
        if(torProgramTwoComplete || torProgramCode == "2"){
            torFunStopProgramList[1] = TorFunStopCellData.init(image: UIImage(named:torProgramTwoImage), message: "COMPLETE")
            torProgramTwoComplete = true
            self.torontoDefaults.set(self.torProgramTwoComplete, forKey: torProgramTwoKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramThreeComplete || torProgramCode == "3"){
            torFunStopProgramList[2] = TorFunStopCellData.init( image: UIImage(named:torProgramThreeImage), message: "COMPLETE")
            torProgramThreeComplete = true
            self.torontoDefaults.set(self.torProgramThreeComplete, forKey: torProgramThreeKey)
            if(segue.identifier == "TorFunStopSegue"){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramFourComplete || torProgramCode == "4"){
            torFunStopProgramList[3] = TorFunStopCellData.init(image: UIImage(named:torProgramFourImage), message: "COMPLETE")
            torProgramFourComplete = true
            self.torontoDefaults.set(self.torProgramFourComplete, forKey: torProgramFourKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList
            }
        }
        if(torProgramFiveComplete || torProgramCode == "5"){
            torFunStopProgramList[4] = TorFunStopCellData.init(image: UIImage(named:torProgramFiveImage), message: "COMPLETE")
            torProgramFiveComplete = true
            self.torontoDefaults.set(self.torProgramFiveComplete, forKey: torProgramFiveKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramSixComplete || torProgramCode == "6"){
            if(torProgramOneComplete && torProgramTwoComplete && torProgramThreeComplete
                && torProgramFourComplete && torProgramFiveComplete){ torFunStopProgramList[5]=TorFunStopCellData.init(image: UIImage(named:torProgramSixImage), message: "COMPLETE")
                torProgramSixComplete = true;
                self.torontoDefaults.set(self.torProgramSixComplete, forKey: torProgramSixKey)
                if(segue.identifier == segueID){
                    let table = segue.destination as!
                    TorFunStopTableViewController
                    table.data1 = torFunStopProgramList
                    let user = Auth.auth().currentUser
                    let uid = user!.uid
                    let myDatabase = Database.database().reference()
                    funStopComplete = true;
                    myDatabase.child("users").child(uid).child("Complete Fun Stop").setValue("Yes")
                }else{
                    let alert = UIAlertController(title: "Not Yet!", message: "Please complete all other stations before coming to the funstop staiton", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert,animated: true, completion: nil)
                }
            }
            torFunStopProgramList[5] = TorFunStopCellData.init(image: UIImage(named:torProgramSixImage), message: "COMPLETE")
            torProgramSixComplete = true
            self.torontoDefaults.set(self.torProgramSixComplete, forKey: torProgramSixKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        /*if(torProgramSevenComplete || torProgramCode == "7"){
            torFunStopProgramList[6] = TorFunStopCellData.init(image: UIImage(named:torProgramSevenImage), message: "COMPLETE")
            torProgramSevenComplete = true
            self.torontoDefaults.set(self.torProgramSevenComplete, forKey: torProgramSevenKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramEightComplete || torProgramCode == "8"){
            torFunStopProgramList[7] = TorFunStopCellData.init(image: UIImage(named:torProgramEightImage), message: "COMPLETE")
            torProgramEightComplete = true
            self.torontoDefaults.set(self.torProgramEightComplete, forKey: torProgramEightKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramNineComplete || torProgramCode == "9"){
            torFunStopProgramList[8] = TorFunStopCellData.init(image: UIImage(named:torProgramNineImage), message: "COMPLETE")
            torProgramNineComplete = true
            self.torontoDefaults.set(self.torProgramNineComplete, forKey: torProgramNineKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramTenComplete || torProgramCode == "10"){
            torFunStopProgramList[9] = TorFunStopCellData.init(image: UIImage(named:torProgramTenImage), message: "COMPLETE")
            torProgramTenComplete = true
            self.torontoDefaults.set(self.torProgramTenComplete, forKey: torProgramTenKey)
            if(segue.identifier == segueID){
                let table = segue.destination as! TorFunStopTableViewController
                table.data1 = torFunStopProgramList;
            }
        }
        if(torProgramElevenComplete || torProgramCode == "11"){
            if(torProgramOneComplete && torProgramTwoComplete && torProgramThreeComplete && torProgramFourComplete && torProgramFiveComplete && torProgramSixComplete && torProgramSevenComplete && torProgramEightComplete && torProgramNineComplete && torProgramTenComplete){ torFunStopProgramList[10]=TorFunStopCellData.init(image: UIImage(named:torProgramElevenImage), message: "COMPLETE")
            torProgramElevenComplete = true;
            self.torontoDefaults.set(self.torProgramElevenComplete, forKey: torProgramElevenKey)
            if(segue.identifier == segueID){
                let table = segue.destination as!
                TorFunStopTableViewController
                table.data1 = torFunStopProgramList
            let user = Auth.auth().currentUser
            let uid = user!.uid
            let myDatabase = Database.database().reference()
                funStopComplete = true;
                myDatabase.child("users").child(uid).child("Complete Fun Stop").setValue("Yes")
            }else{
                let alert = UIAlertController(title: "Not Yet!", message: "Please complete all other stations before coming to the funstop staiton", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert,animated: true, completion: nil)
            }
        }
    }*/
}
    
    @IBAction func startTorFunStopMap(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
        let TorFunStopMap = storyBoard.instantiateViewController(withIdentifier: "TorFunStopMap") as! TorFunStopMap;
        self.present(TorFunStopMap, animated: true, completion: nil)
    }
    
    @IBAction func startTorCamera(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let TorQRCodeScanner = storyBoard.instantiateViewController(withIdentifier: "TorQRCodeScanner") as! TorQRCodeScanner;
        self.present(TorQRCodeScanner, animated: true, completion: nil)
    }
    
    @IBAction func startTorMainMenu(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let TorMainMenu = storyBoard.instantiateViewController(withIdentifier: "TorMainMenu") as! TorMainMenu;
        self.present(TorMainMenu, animated: true, completion: nil)
    }
    @IBAction func startTorFunStopRule(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let TorRule = storyBoard.instantiateViewController(withIdentifier: "TorRule") as! TorRule;
        self.present(TorRule, animated: true, completion: nil)
    }
    
}
    



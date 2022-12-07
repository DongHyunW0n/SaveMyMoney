//
//  ViewController.swift
//  SaveMyMoney

//
//  Created by WonDongHyun on 2022/12/06.
//

import UIKit

class MainVC: UIViewController {
    
    
    
    
    var payLists1 = [payList]()

    var totalAmounts : Int = 0 {
        
        didSet{
            totalLabel.text = "\(totalAmounts)원"
        }
    }
   

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func tabAddButton(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "등록", message: "소비 타입과 금액을 입력하시오", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록하기", style: .default, handler: { [weak self] _ in
            
            guard let type = alert.textFields?[0].text else{return} //텍스트필드 첫번째 값 받아오기
            guard let amount = alert.textFields?[1].text else{return}// 텍스트타입 두번째 값 받아오기
            
            let pay = payList(type: type, amount: amount)
            
            let casting = Int(amount)
            
           
            self?.totalAmounts += casting ?? 0
            
            
            self?.payLists1.append(pay)
            self?.mainTableView.reloadData() // 저장하면 그 값을 저장하고 테이블뷰를 최신으로 갱신
            
            print("버튼이 눌려져따")
            print("정수로 변환된 \(String(describing: casting))")
            print("토탈값 : \(String(describing: self?.totalAmounts))")
            
        })
        
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "소비 타입을 입력하세요. ex)식비"
        })
        alert.addTextField(configurationHandler: {textField in
            textField.placeholder = "금액을 숫자로만 입력하세요. ex)5000"
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
//    func save(){
//
//        let data1 = self.payLists.map{
//
//            [
//                "type" : $0.type,
//                "amount" : $0.amount
//
//            ]
//
//            let userDefaults = UserDefaults.standard
//
//
//
//        }
//    }
    
}


extension MainVC : UITableViewDelegate {
    
    
    
}


extension MainVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payLists1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let pay = self.payLists1[indexPath.row]
        cell.cellTypeLabel?.text = pay.type
        cell.cellAmountLabel?.text = "\(pay.amount)원"
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            tableView.beginUpdates()
            
            
            
            payLists1.remove(at: indexPath.row)
            
            
        
        
            
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
           
        
        }
    }
    
    
}


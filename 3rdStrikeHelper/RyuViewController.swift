//
//  RyuViewController.swift
//  3rdStrikeHelper
//
//  Created by curitiba01 on 08/03/21.
//

import UIKit

// Table View

class TableViewCell1: UITableViewCell {
    
    @IBOutlet weak var comboImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet weak var stunLabel: UILabel!
    @IBOutlet weak var meterLabel: UILabel!
    @IBOutlet weak var rangeLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    @IBOutlet weak var viewExpandable: UIView! {
        didSet {
            viewExpandable.isHidden = true
        }
    }
    
}

class RyuViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var moveList: UIView!
    @IBOutlet weak var baseStats: UIScrollView!
    @IBOutlet weak var advanced: UIView!
    
    @IBAction func segmentedControl(_ sender: Any) {
        segmentedCheck()
    }
    
    func segmentedCheck() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            moveList.isHidden = false
            baseStats.isHidden = true
            advanced.isHidden = true
        case 1:
            moveList.isHidden = true
            baseStats.isHidden = false
            advanced.isHidden = true
        case 2:
            moveList.isHidden = true
            baseStats.isHidden = true
            advanced.isHidden = false
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedCheck()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToRyu(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    // Table View
    
    let titleCombo = ["cl.HP x H.Shoryuken", "cl.HP x EX.Joudan Sokutou, H.Shoryuken", "cr.HP x EX.Joudan Sokutou, H.Tatsu", "cr.MK x EX.Hadouken", "cr.HP x EX.Tatsu, Shinkuu Hadouken, H.Tatsu"]
    let subtitleCombo = ["Standard meterless close-range punish.", "Standard metered close-range punish, costs half bar.", "Mid-range parry punish with good corner carry.", "Long range safe on block string or punish.", "Full bar corner punish."]
    let damageLabel = ["90", "80", "75", "100", "95"]
    let stunLabel = ["32", "25", "30", "37", "29"]
    let meterLabel = ["50", "55", "45", "40", "52"]
    let rangeLabel = ["close", "close", "open", "close", "open"]
    let difficultyLabel = ["Easy", "Easy", "Medium", "Hard", "Hard"]
    let characterLabel = ["All", "All", "All", "All", "All"]

}

extension RyuViewController: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleCombo.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell1
        
        let titleList = titleCombo[indexPath.row]
        let subtitleList = subtitleCombo[indexPath.row]
        let image = UIImage(named: "combovid")
        let damage = damageLabel[indexPath.row]
        let stun = stunLabel[indexPath.row]
        let meter = meterLabel[indexPath.row]
        let range = rangeLabel[indexPath.row]
        let difficulty = difficultyLabel[indexPath.row]
        let character = characterLabel[indexPath.row]
        
        cell.comboImageView.image = image
        cell.titleLabel.text = titleList
        cell.subtitleLabel.text = subtitleList
        cell.damageLabel.text = damage
        cell.stunLabel.text = stun
        cell.meterLabel.text = meter
        cell.rangeLabel.text = range
        cell.difficultyLabel.text = difficulty
        cell.characterLabel.text = character
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell1 {
            UIView.animate(withDuration: 0.3) {
                cell.viewExpandable.isHidden = !cell.viewExpandable.isHidden
            }
            tableView.beginUpdates()
            tableView.endUpdates()
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}

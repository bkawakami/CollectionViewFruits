//
//  ViewController.swift
//  ErrorCollectionView
//
//  Created by Bruno Kawakami on 12/6/15.
//  Copyright © 2015 Bruno Kawakami. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, CardsLayoutDelegate {

    var fruitsCollection = [FruitsObject](
        arrayLiteral: FruitsObject(name: "Maça",descr: "",image: "http://nutritechrj.com.br/sistema/imagens/artigos/m_8_maca.jpg"),
        FruitsObject(name: "Banana",descr: "",image: "http://www.casseta.com.br/lapena/files/2014/04/Banana_dani.jpg"),
        FruitsObject(name: "Pêssego",descr: "",image: "http://www.saudedicas.com.br/wp-content/uploads/2012/06/pessego-propriedades-saudaveis-do-pessego-1024x798.jpg")
    )
    var fruits = [FruitsObject]()
    
    @IBOutlet var uiCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let layout = collectionView?.collectionViewLayout as? CardsLayout {
            layout.delegate = self
        }
        
        self.fruits = self.fruitsCollection
        self.uiCollectionView.reloadData()
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.fruits.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FruitsCollectionViewCell", forIndexPath: indexPath) as! FruitsCollectionViewCell
        cell.fruits = self.fruits[indexPath.item]
        return cell
    }
    
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath , withWidth width:CGFloat) -> CGFloat {
        return 160
    }
    
    @IBAction func showOnlyApple(sender: AnyObject) {
        var justApple = [FruitsObject]()
        for item in self.fruitsCollection{
            if (item.name! == "Maça") {
                justApple.append(item)
            }
        }
        self.fruits = justApple
        self.uiCollectionView.reloadData()
    }
    
    func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        let height = annotationPadding + annotationHeaderHeight + annotationPadding
        return height
    }

}


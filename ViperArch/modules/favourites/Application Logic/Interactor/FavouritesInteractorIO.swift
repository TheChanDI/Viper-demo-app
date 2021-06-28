//
//  FavouritesInteractorIO.swift
//  ViperArch
//
//  Created by ENFINY INNOVATIONS on 6/25/21.
//
//

import UIKit

protocol FavouritesInteractorInput: class {
    func deleteAllList()
    func deleteSpecificItem(indexPath: IndexPath)
}

protocol FavouritesInteractorOutput: class {

}

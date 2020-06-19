//
//  blackoutViewModel.swift
//  blackout
//
//  Created by Sam Crochet on 6/14/20.
//  Copyright © 2020 Sam Crochet. All rights reserved.
//

import SwiftUI

/**
this class is the ViewModel component to be used by the view to represent the data in the model
VM is the necessary intemediary between the model and the view, to transform the model for the view and also handle actions
 
The contstraint here is we are making our view model use a protocol called Observable object, but this allows for our UI to finallt be interactive
 
*/
class blackoutApp: ObservableObject{
    
    /**
    Made this a private variable, so that only the viewModel class could interact with the model object
    Initalized a new instance of the model with this paragraph of text
     
    Adding the @Published property wrapper to our model variable to signal that when anything changes
    to our model, we want to signal this to the view and then repaint everything in accordance to those updates
     */
    @Published private var model: blackoutModel = blackoutModel(
        poem:"Proin facilisis iaculis sapien, nec dictum ipsum iaculis eget. Sed urna ligula, congue vel sapien cursus, pulvinar porttitor odio. Phasellus commodo et nulla vel imperdiet. In ex orci, mollis sit amet congue a, volutpat et leo. Mauris at aliquet diam. Proin augue metus, interdum vel ultrices vel, varius quis ligula. Aenean metus odio, interdum ut tristique sed, facilisis at diam. Proin posuere mollis diam, vel pellentesque metus suscipit sollicitudin. Vivamus in risus tempus, efficitur neque vitae, fermentum velit. Donec ac sem orci. Nullam suscipit luctus lorem, et vehicula massa laoreet nec. Donec sagittis vitae sapien eget egestas. Sed posuere at massa sed laoreet. Cras consequat, turpis eu sodales lobortis, massa ante lobortis nunc, quis efficitur ligula nisl id velit. Nulla id pretium diam. Nullam vel libero eget felis dapibus tristique."
    )
        
    // MARK: - access to model content
    
    /**
    This is a variable of the view model class, that view can use to bind data and represent the model,
    this is also a computed variable
    */
    var words: Array<blackoutModel.Word> {
        model.words
    }
    
    // MARK: - intent
    
    /**
    This is to be later used by the view to mark a word
    Takes in a word and marks that word
    */
    func mark(word: blackoutModel.Word){
        model.mark(word: word)
        
    }
    
    /**
    This is to be used later to save the poem that was made as plaintext
    */
    func export(){
        print(model.export())
    }
}

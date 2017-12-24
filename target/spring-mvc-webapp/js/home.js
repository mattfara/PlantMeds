/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
    
//EVENT LISTENERS
    //CLICKS
    
    $("#btn-searchByIllness").click(function () {
        fadeOutButtonStack();
        fadeInSearchByIllnessForm();
    });
    
    $("#btn-searchByPlant").click(function () {
        fadeOutButtonStack();
        fadeInSearchByPlantForm();
    });
    
    $("#btn-logIn").click(function () {
        fadeOutButtonStack();
        fadeInLogInForm();
    });
    
    
    
});


//BUTTON STACK
function fadeInButtonStack() {
    $(".stackedButtons").fadeIn("slow").delay(2000);
}

function fadeOutButtonStack() {
    $(".stackedButtons").fadeOut("slow").delay(2000);
    emptyForms();
}

//FORMS
    //SEARCH BY ILLNESS


function fadeInSearchByIllnessForm() {
    $('#searchByIllnessForm').show();
    $('#searchByIllnessForm').fadeIn("slow").delay(2000);
}

function fadeOutSearchByIllnessForm() {
    $('#searchByIllnessForm').fadeOut("slow").delay(2000);
    emptyForms();
}

    //SEARCH BY PLANT

function fadeInSearchByPlantForm() {
    $('#searchByPlantForm').fadeIn("slow").delay(2000);
}
function fadeOutSearchByPlantForm() {
    $('#searchByPlantForm').fadeOut("slow").delay(2000);
    emptyForms();
}

    //LOG IN FORM

function fadeInLogInForm() {
    $('#logInForm').fadeIn("slow").delay(2000);
}
function fadeOutLogInForm() {
    $('#logInForm').fadeOut("slow").delay(2000);
    emptyForms();
}


//MISC


function fadeOutAllForms() {
    $('#searchByIllnessForm').fadeOut("slow").delay(2000);
    $('#searchByPlantForm').fadeOut("slow").delay(2000);
    $('#logInForm').fadeOut("slow").delay(2000);
}

function emptyForms(){
    $('form').empty();
}
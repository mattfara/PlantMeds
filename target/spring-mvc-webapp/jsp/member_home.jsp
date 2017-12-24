<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PlantMeds - Member Home</title>
        <!-- Bootstrap core CSS -->
        <!-- Latest compiled and minified CSS -->
        <!-- VERSION 4 -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

        <!-- VERSION 3 -->
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->



        <link href="css/home.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Marck+Script" rel="stylesheet">
    </head>
    <body>

        <!-- this div holds the background -->
        <div id="homePageImg"></div>
        <div class="container">
            <div class="top-left title">PlantMeds</div>
            <div class="stackedButtons btn-group-vertical">
                <button class="btn btn-outline-warning separated">Identify Plant</button>
                <button class="btn btn-outline-primary separated">Submit Assessment</button>
                <button class="btn btn-outline-danger separated" id="btn-searchByIllness">Search by Illness</button>
                <button class="btn btn-outline-success separated" id="btn-searchByPlant">Search by Plant</button>
                <button class="btn btn-outline-info" id="btn-logIn">Log Out</button>
            </div>
            <!--            <img class="pageDivider" src="images/pageDivider-floral.png"/>
                                    <div id="about" style="width:100%; margin-top:20px">
                                        <p style="font-weight: bolder">Find plants to ease your suffering.</p> 
                                        <ul>
                                            <li><a id="searchByIllness" style="color:red">Search by illness</a> to see where medicinal plants are located. </li>
                                            <li><a id="searchByPlant" style="color:green">Search by plant</a> if you had one in mind already. </li>
                                            <li><a id="logIn" style="color:blue">Log in</a> if you want to contribute to the community, posting the locations of plants, and much more. </li>
                                        </ul>
                                        <p>Enjoy <span style="font-family: 'Marck Script', cursive">PlantMeds</span>.</p>
                                    </div>-->

            <!-- FORMS -->

            <!-- SEARCH BY ILLNESS FORM -->
            <form id="searchByIllnessForm" style="display:none">
                <label>Illness: </label>
                <input type="text" placeholder="Enter illness"/>
                <fieldset>
                    <legend>Your Location</legend>
                    <p>Within <select>
                            <option>1</option>
                            <option>5</option>
                            <option>10</option>
                            <option>20</option>
                            <option>50</option>
                        </select> mile(s) of</p>
                    <input type="text" placeholder="Type in your starting point"/>
                </fieldset>
                <div class="btn-group">
                    <button id="submitIllnessFormBtn" class="btn btn-outline-danger">Search</button>
                    <button class="btn btn-outline-danger cancel-btn">Cancel</button>
                </div>
            </form>

            <!-- SEARCH BY PLANT FORM -->
            <form id="searchByPlantForm" style="display:none">
                <label>Plant: </label>
                <input type="text" placeholder="Enter plant's common or technical name"/>
                <fieldset>
                    <legend>Your Location</legend>
                    <p>Within <select>
                            <option>1</option>
                            <option>5</option>
                            <option>10</option>
                            <option>20</option>
                            <option>50</option>
                        </select> mile(s) of</p>
                    <input type="text" placeholder="Type in your starting point"/>
                </fieldset>
                <div class="btn-group">
                    <button id="submitIllnessFormBtn" class="btn btn-outline-danger">Search</button>
                    <button class="btn btn-outline-danger cancel-btn">Cancel</button>
                </div>
            </form>
            <!-- end search by plant form -->
            <!-- ASSESSMENT FORM -->


            <!-- https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_datalist -->
            <!-- see this for how to use datalist input -->
            <!-- guess I could just use an ajax call to get this populated -->
            <!-- then once one is selected, it fills the technical name and -->
            <!-- prepopulates the illness drop down -->
            <!-- and that being filled fills the possible methods of use -->

            <form id="assessmentForm" style="display:none">
                <div class="form-group">
                    <fieldset>
                        <legend>Plant: </legend>
                        <label>Common name: </label>
                        <input list="plants-by-common-name" name="plant" placeholder="type in a name"/>
                        <datalist id="plants-by-common-name">
                            <!-- Consider using a straight search to avoid loading potentially tens of
                                    thousands of results -->
                            <!-- Ajax will load the "option value = " tags here -->
                            <!-- Should be able to load -->
                        </datalist>
                        <label>Technical name: </label>
                        <input list="plants-by-technical-name" name="plant" placeholder="type in a name"/>
                        <datalist id="plants-by-technical-name">
                            <!-- Ajax will load the "option value = " tags here -->
                        </datalist>
                    </fieldset>
                    <fieldset>
                        <legend>Ailment: </legend>
                        <label>Common name: </label>
                        <input list="ailments-by-common-name" name="ailment" placeholder="type in a name"/>
                        <datalist id="ailments-by-common-name">
                            <!-- Ajax will load the "option value = " tags here -->
                        </datalist>
                        <label>Technical name: </label>
                        <input list="ailments-by-technical-name" name="ailment" placeholder="type in a name"/>
                        <datalist id="ailments-by-technical-name">
                            <!-- Ajax will load the "option value = " tags here -->
                        </datalist>
                    </fieldset>
                    <fieldset>
                        <legend>Effectiveness: </legend>
                        <input type="radio" name="effectiveness" value="1"> No relief
                        <input type="radio" name="effectiveness" value="2"> Slight relief
                        <input type="radio" name="effectiveness" value="3"> Moderate relief
                        <input type="radio" name="effectiveness" value="4"> Strong relief
                        <input type="radio" name="effectiveness" value="5"> Completely relieved
                    </fieldset>
                    <label>Method of use: </label>
                    <select>
                        <!-- filled with ajax called based on plant_illness id --> 
                    </select>
                    <label>Comments: </label>
                    <textarea placeholder="Type any comments, e.g., Taste, smell, deviations from instructions, etc"></textarea>
                    <div class="btn-group">
                        <button type="button" id="submit">Submit</button>
                        <button type="button" id="cancel">Cancel</button>
                    </div>
                </div>
            </form>

            <!-- assessment form end -->

            <!-- FORMS END -->    
            <!-- DIALOG BOXES -->



            <!-- PLANT SEARCH RESULT DIALOG -->
            <dialog>
                <!-- this should return a list -->
                <div id='errorMsg'></div>
                <h1>Results</h1>
                <div id='plantResultTable'>
                    <table>
                        <tr>
                            <th width="25%">Plant Common Name(s): </th>
                            <th width="15%">Plant Technical Name(s): </th>
                            <th width="15%">Treats: </th>
                            <th width="15%">Image: </th>
                        </tr>
                        <tbody id="plantSearchResults">
                            <tr>

                                <td><a v-on:click="showEditPageForm(' + {{page.id}} + ')">Edit</a> | <a v-on:click="deletePage(' + {{page.id}} + ')">Delete </a>| <a v-on:click="viewPage(' + {{page.id}} + ')">View</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </dialog>
            <!-- PLANT SEARCH END -->

            <!-- AILMENT SEARCH RESULT DIALOG -->
            <dialog>
                <!-- this should return a map and list -->
            </dialog>
            <!-- AILMENT SEARCH END -->

        </div>





        <!-- Latest compiled JavaScript -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!--VERSION 4-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
        <!-- VERSION 3 -->
        <script src="js/home.js"></script>
        <!--            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

    </body>
</html>



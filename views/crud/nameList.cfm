<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Name List</title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>

    </style>
</head>
<cfparam name="name" value="" default="" />
<cfparam name="age" value="" default="" />
<cfparam name="address" value=""  default="" />
<body>
    <div class="container bg-danger">
        <h2 class="text-center text-dark">User Information</h2>
        
        <!--Form Section-->
        <div class="card mb-4">
            <div class="card-body">
                <form id="userForm" class="needs-validation" novalidate>
                    <input type="hidden" id="userId"/>
                    <div class="row g-3">
                        <div class="col-md-4"> 
                            <label for="name" class="form-label">Name</label>
                            <input type="text" name="name" id="name" value="#prc.userDetails.name ?: ''#" class="form-control"  placeholder="Enter Name" required>
                            <div class="invalid-feedback">
                                Please enter the name
                            </div>
                        </div>   
                        <div class="col-md-4">
                            <label for="age" class="form-label">Age</label>
                            <input type="number" name="age" id="age" value="#prc.userDetails.age ?: ''#" class="form-control" placeholder="Enter Age" required>
                            <div class="invalid-feedback">
                                Please enter the age
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" name="address" id="address" value="#prc.userDetails.address ?: ''#" class="form-control" placeholder="Enter Address" required>
                            <div class="invalid-feedback">
                                Please enter the address
                            </div>
                        </div>
                    </div>
                    <div class="mt-4 text-center">
                        <button type="submit" name="submit" class="btn btn-primary">Save</button>
                        <button type="reset" class="btn btn-secondary" id="resetBtn">Reset</button>
                    </div>
                </form>
            </div>
        </div>
         <table class="table" id="userTable" class="display">
            <thead>
                <tr class="table-success">
                    <th>Name</th>
                    <th>Age</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="#prc.getUserData#">
                    <tr class="table-primary">
                        <td>#prc.getUserData.name#</td>
                        <td>#prc.getUserData.age#</td>
                        <td>#prc.getUserData.address#</td>
                        <td>
                            <a href="#event.buildLink('crud.nameList', {id=#prc.getUserData.id#,update='true'})#" id="editUser" class="edit-btn"><i class="fas fa-edit text-primary"></i></button>
                            <a href="#event.buildLink('crud.nameList', {id=#prc.getUserData.id#,delete='true'})#" class="delete-btn"><i class="fas fa-trash-alt text-danger"></i></a>
                        </td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
        <!-- Bootstrap Modal -->
        <div class="modal fade editModal" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
                
            </div>
            </div>
        </div>
        </div>
    </div>
    <script>
    $(document).ready(function() {
      $('##userTable').DataTable();
        'use strict';
        // Fetch all forms with the class 'needs-validation'
        $('.needs-validation').each(function () {
        var form = $(this);
        form.on('submit', function (event) {
            // Use DOM element's checkValidity
            if (!this.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.addClass('was-validated');
        });
    });
    });
  </script>
</body>
</html>
</cfoutput>
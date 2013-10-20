<aside id="sidebar">
  <h1 class="title">Options</h1>
  <span class="icn-desc title">
    <a href="#setting">
      <i class="icon-tag"></i>
    </a>
  </span>
  <div class="clearfix"></div>
  <h4 class="list-title">View</h4>
  <ul id="listview" class="nav-list">
    <li class="active"><a href="#"><i class="icon-list"></i>List View</a></li>
    <li><a href="#"><i class="icon-th-list"></i>Content View</a></li>
  </ul>
</aside>
<section id="primary-content">
  <h1 class="title">Students</h1>
  <span class="icn-desc title">
    <a href="#add-student" id="btn-add-student">
      <i class="icon-plus-sign"></i>
      Add
    </a>
  </span>
  <button id="generate-report" class="btn btn-success btn-large"><i class="icon-file-text"></i>Generate Report</button>
  <section class="search container">
    <label for="student-search">Search for</label>
    <input id="txtSearchStudents" name="student-search" class="search" type="search" placeholder="Who are you looking for?">
  </section>
  <table id="student-list" class="table">
    <thead>
      <tr>
        <th><i class="icon-picture"></i>
        <th>Name
        <th>Username
        <th>Address
        <th>Email
        <th>Contact
        <th>Manage
      </tr>
    </thead>
    <tbody>
      <tr class="student" data-student-id="1">
        <td><img src="uploads/profile/thumbs/rea.jpg" alt="">
        <td><span contenteditable data-fieldname="name">Rea Aborot</span>
        <td><span contenteditable data-fieldname="username">chirea</span>
        <td><span contenteditable data-fieldname="address">#321 Kaguluhan St., Bgy. Kapayapaan, Q.C.</span>
        <td><span contenteditable data-fieldname="email">hi@reaaborot.com</span>
        <td><span contenteditable data-fieldname="contact">+639057894321</span>
        <td><a href="#"><i class="icon-trash"></i></a>
      </tr>
      <tr class="student" data-student-id="2">
        <td><img src="uploads/profile/thumbs/sean.jpg" alt="">
        <td><span contenteditable data-fieldname="name">Sean Amador</span>
        <td><span contenteditable data-fieldname="username">seanmichael</span>
        <td><span contenteditable data-fieldname="address">#123 Swag St., Kalusugan Village, Rizal</span>
        <td><span contenteditable data-fieldname="email">hello@seanamador.com</span>
        <td><span contenteditable data-fieldname="contact">+639054321000</span>
        <td><a href="#"><i class="icon-trash"></i></a>
      </tr>
    </tbody>
  </table>
</section>

<div id="add-dialog" class="dialog">
  <button class="close"><i class="icon-remove"></i></button>
  <h1 class="title"><i class="icon-plus"></i>Student</h1>
  <form method="post">
    <input type="hidden" name="intent" value="c">
    <input class="form-control" type="text" name="username" placeholder="Username" required>
    <input class="form-control" type="email" name="email" placeholder="Email" required>
    <input class="form-control" type="password" name="password" placeholder="Password" required>
    <button id="btn-register-student" type="submit" class="btn btn-primary btn-block btn-large">Add Student</button>
  </form>
</div>
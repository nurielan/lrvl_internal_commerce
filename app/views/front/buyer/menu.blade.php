						<div class="panel panel-default">
							<div class="panel-heading">
								<span>Menu</span>
							</div>

							<div class="panel-body">
								<div class="list-group">
									<a>Your Point: {{ Auth::buyer()->user()->point }}</a>
									<a class="list-group-item {{ (Request::is('buyer/show') ? 'active' : '') }}" href="{{ route('f_buyer_show') }}">Show</a>
									<a class="list-group-item {{ (Request::is('buyer/edit') ? 'active' : '') }}" href="{{ route('f_buyer_edit') }}">Edit</a>
									<a class="list-group-item {{ (Request::is('buyer/edit_password') ? 'active' : '') }}" href="{{ route('f_buyer_edit_password') }}">Edit Password</a>
									<a class="list-group-item" href="{{ route('f_buyer_logout') }}"><span class="fa fa-sign-out"></span>&nbsp;Logout</a>
								</div>
							</div>
						</div>
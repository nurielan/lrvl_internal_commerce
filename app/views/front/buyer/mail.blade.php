<h1>Internal Group</h1>
<hr>
<table>
	<tr>
		<td>Name</td>
		<td>:</td>
		<td>{{ $name }}</td>
	</tr>

	<tr>
		<td>Confirmation Link</td>
		<td>:</td>
		<td><a href="{{ route('f_buyer_confirm_email', $email_code) }}">Copy or click this link.</a></td>
	</tr>
</table>
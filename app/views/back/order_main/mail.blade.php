<h1>Internal Group Store</h1>
<h3>Sales Department Store</h3>
<hr>
<p>Order with code "{{ $data->code }}" has been confirmed at {{ date('d-m-Y', strtotime($data->updated_at)) }}.</p>
<a href="{{ route('b_post_order_main_mail', $data->id) }}">Accept Order</a>
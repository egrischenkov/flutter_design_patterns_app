import 'customer/customer_details.dart';
import 'customer_details_service.dart';
import 'i_customer_details_service.dart';

class CustomerDetailsServiceProxy implements ICustomerDetailsService {
  final _customerDetailsService = CustomerDetailsService();
  final Map<String, CustomerDetails> _customerDetailsCache = {};

  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    if (_customerDetailsCache.containsKey(id)) {
      return _customerDetailsCache[id]!;
    }

    final customerDetails = await _customerDetailsService.getCustomerDetails(id);
    _customerDetailsCache[id] = customerDetails;

    return customerDetails;
  }
}
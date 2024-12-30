mixin Contact {
  String? address;
  String? cnpj;
  String? tell;
  String? email;

  get getAddress => this.address;

  set setAddress(address) => this.address = address;

  get getCnpj => this.cnpj;

  set setCnpj(cnpj) => this.cnpj = cnpj;

  get getTell => this.tell;

  set setTell(tell) => this.tell = tell;

  get getEmail => this.email;

  set setEmail(email) => this.email = email;

  void showContact() {
    print('Address: ${this.address}');
    print('CNPJ: ${this.cnpj}');
    print('Tell: ${this.tell}');
    print('Email: ${this.email}');
  }
}

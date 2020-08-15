import 'package:Shurli/common/grpc_commons.dart';
import 'package:Shurli/model/shurli.pb.dart';
import 'package:Shurli/model/shurli.pbgrpc.dart';

class ShurliService {
  static Future<WalletInfoResponse> WalletInfo() async{
    var client = ShurliServiceClient(GrpcClientSingleton().client);
    return await client.walletInfo(WalletInfoRequest());
  }
}

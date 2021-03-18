from substrateinterface import SubstrateInterface
from substrateinterface.utils.ss58 import ss58_encode

substrate = SubstrateInterface(
    # url="http://78.47.58.121:9933/",
    url="wss://pme.polymath.network/",
    address_type=2,
    type_registry_preset='polymesh'
)

# Set block_hash to None for chaintip
block_hash = "0x0a432dd8441621bc2985caa36d10c241170a2d43e764845438069b1caf1eae77"
block_hash = "0xe23e1d389d453935dfe6ee532e06c0930ab51b3e1beaf948d8529f74e68c985b"

metadata_decoder = substrate.get_block_metadata(block_hash=block_hash, decode=True)
# Retrieve extrinsics in block
result = substrate.get_block_events(block_hash=block_hash, metadata_decoder=metadata_decoder)

print(result)

# for extrinsic in result['block']['extrinsics']:

#     if 'account_id' in extrinsic:
#         signed_by_address = ss58_encode(address=extrinsic['account_id'], address_type=2)
#     else:
#         signed_by_address = None

#     print('\nModule: {}\nCall: {}\nSigned by: {}'.format(
#         extrinsic['call_module'],
#         extrinsic['call_function'],
#         signed_by_address
#     ))

#     # Loop through params
#     for param in extrinsic['params']:

#         if param['type'] == 'Address':
#             param['value'] = ss58_encode(address=param['value'], address_type=2)

#         if param['type'] == 'Compact<Balance>':
#             param['value'] = '{} DOT'.format(param['value'] / 10**12)

#         print("Param '{}': {}".format(param['name'], param['value']))
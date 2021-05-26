
DO NOT ADD THESE:
```
    "AccountInfo": "AccountInfoWithRefCount",
    "Address": "IndicesLookupSource",
    "LookupSource": "IndicesLookupSource",
```

Polymesh hacks are found at the end of `polymesh.json` :
```
    "CompactAssignments": "CompactAssignmentsFrom258",
    "RefCount": "RefCount",
    "secondary_key::api::LegacyPermissions": "LegacyPermissions",
    "secondary_key::api::secondarykey<accountid>": "SecondaryKey",
    "<T as IdentityTrait>::OffChainSignature": "OffChainSignature",
    "ethereum::EcdsaSignature": "EcdsaSignature",
    "ethereum::EthereumAddress": "EthereumAddress",
    "SessionKeysPolkadot": {
      "type": "struct",
      "type_mapping": [
        ["grandpa", "AccountId"],
        ["babe", "AccountId"],
        ["im_online", "AccountId"],
        ["authority_discovery", "AccountId"]
      ]
    },
    "Keys": "SessionKeysPolkadot",
    "Box<<T as frame_system::Trait>::Call>":"BoxProposal",
    "<T as frame_system::Trait>::Call":"Proposal"
```

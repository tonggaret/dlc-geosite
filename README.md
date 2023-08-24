# dlc-geosite

[![Build](https://github.com/tonggaret/dlc-geosite/actions/workflows/build.yml/badge.svg)](https://github.com/tonggaret/dlc-geosite/actions/workflows/build.yml)

## Source domain filter

 - **AdGuardSDNSFilter**
   > `https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/AdGuardSDNSFilter/AdGuardSDNSFilter_Domain.yaml`
 - **AdAway**
   > `https://raw.githubusercontent.com/deathbybandaid/piholeparser/master/Subscribable-Lists/ParsedBlacklists/AdAway-Default-Blocklist.txt`
 - **ABPindo**
   > `https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/domain.txt`
 - **1Hosts-Lite**
   > `https://raw.githubusercontent.com/badmojr/1Hosts/master/Lite/domains.txt`
 - **HaGeZiLight**
   > `https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/light.txt`


## Clash

### GeoSite.dat

```yaml
geox-url:
  geosite: https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/GeoSite.dat/GeoSite.dat

rules:
  - GEOSITE,category-ads-all,REJECT
```

### Rule provider

```yaml
rule-providers:
  category-ads-all:
    type: http
    url: https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/category-ads-all/category-ads-all
    behavior: domain
    path: ./providers/rules/category-ads-all
    interval: 86400
    format: text

rules:
  - RULE-SET,category-ads-all,REJECT
```

## Sing-box

### GeoSite.db

```json
  "route": {
    "geosite": {
      "path": "./GeoSite.db",
      "download_url": "https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/GeoSite.db/GeoSite.db",
      "download_detour": "direct"
    },
    "rules": [
      {
        "geosite": "category-ads-all",
        "outbound": "block"
      }
    ]
  }
```

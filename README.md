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
 - **HaGeZi's Pro mini**
   > `https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/pro.mini-onlydomains.txt`

## Usage

### Clash

#### GeoSite.dat

```yaml
geox-url:
  geosite: https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/GeoSite.dat/GeoSite.dat

rules:
  - GEOSITE,category-ads-all,REJECT
```

#### Rule provider

```yaml
rule-providers:
  category-ads-all:
    type: http
    url: https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/category-ads-all/category-ads-all
    behavior: domain
    path: ./category-ads-all
    interval: 86400
    format: text

rules:
  - RULE-SET,category-ads-all,REJECT
```

#### Rule Set mrs

```yaml
rule-providers:
  category-ads-all:
    type: http
    url: https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/category-ads-all.mrs/category-ads-all.mrs
    behavior: domain
    path: ./category-ads-all.mrs
    interval: 86400
    format: mrs

rules:
  - RULE-SET,category-ads-all,REJECT
```

### Sing-box

#### GeoSite.db

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

#### Rule Set

```json
  "route": {
    "rule_set": [
      {
        "type": "remote",
        "tag": "category-ads-all",
        "format": "binary",
        "url": "https://raw.githubusercontent.com/tonggaret/dlc-geosite/subscribe/category-ads-all.srs/category-ads-all.srs",
        "download_detour": "direct",
        "update_interval": "12h0m0s"
      }
    ],
    "rules": [
      {
        "rule_set": "category-ads-all",
        "outbound": "block"
      }
    ]
  }
```

## Credits

 - [CHIZI-0618/sing-geosite](https://github.com/CHIZI-0618/sing-geosite)

 - [malikshi/v2ray-rules-dat](https://github.com/malikshi/v2ray-rules-dat)

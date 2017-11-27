Return-Path: adrian.sev@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b17788c3
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 11:35:13 +0000 (UTC)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
 [209.85.128.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 581681fe
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2017 11:35:13 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id r2so19634020wra.13
 for <wireguard@lists.zx2c4.com>; Mon, 27 Nov 2017 03:40:58 -0800 (PST)
Return-Path: <adrian.sev@gmail.com>
Received: from hal.home (5-12-35-87.residential.rdsnet.ro. [5.12.35.87])
 by smtp.gmail.com with ESMTPSA id p42sm50989869wrb.28.2017.11.27.03.40.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Nov 2017 03:40:56 -0800 (PST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: wg usage :: questions/proposals
Message-ID: <4d6cd46f-dca8-7b9c-4c22-b5062244093e@gmail.com>
Date: Mon, 27 Nov 2017 13:40:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi! I started yesterday to use Wireguard and in about 1h i already had 
in place about a dozen of tunnels .. so, yeah, this project is at this 
level of awesomeness ..

Following the usage patterns i encountered some steps that i think that 
can be simplified :

#####
1. it would be useful if wg could use the ip command and take (and save)
device information with showconf .. something like :
[Device]
NAME=wg0
IP_CIDR=some_ip/netmask
..
any pairs of options belonging to "ip link add"
..
OPTARGS="string to be used with ip link add"

and wg could parse this section and run

ip link add dev NAME <pairs_of_options> OPTARGS type wireguard
ip address add dev NAME IP_CIDR

Aditionaly maybe would be useful an
[Device_Options]
options of "ip link set"
.......
OPTARGS="string to be used with ip link set"

and similar run
ip link set NAME <pairs_of_options> OPTARGS

after parsing of Device sections wg would run
ip link set up dev NAME

if NAME exists setconf would throw "Device already setup" but with some 
"force" option like "wg -f setconf" it would delete the found device and 
proceed with the configuration

#####
2. maybe the keys format could be something like :
key ; ip:port(mandatory) ; hostname (optional)

this way one could do for the server case :
wg set ${DEV} private-key ${PRIV_KEY}
without listen-port

for the client case :
wg set ${DEV} private-key CLIENT_PRIV_KEY_FILE peer SERVER_PUB_KEY_FILE 
allowed-ips 0.0.0.0/0 persistent-keepalive 25

where endpoint information is taken from the server public key file

and for the additions of the peers :
wg set ${DEV} peer PEER_PUB_KEY_FILE

where allowed-ips is taken from the file

#####
3. is allowed-ips only an ip? could be a network?
for cases where the client is taking the ip from dhcp and the network is
known and the tunnel stays even if the ip changes ..

Thank you very much for your great work!!
Adrian

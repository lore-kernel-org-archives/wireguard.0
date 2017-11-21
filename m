Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4479d8b
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 13:16:51 +0000 (UTC)
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
 [209.85.128.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c14b401f
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 13:16:51 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id 11so7939873wrb.6
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 05:21:50 -0800 (PST)
MIME-Version: 1.0
From: d tbsky <tbskyd@gmail.com>
Date: Tue, 21 Nov 2017 21:21:49 +0800
Message-ID: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
Subject: multi-home difficulty
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi:
   I tested wireguard and the speed is amazing. but when I try to
deploy it to our real linux firewall, I found it is hard to make it
work.

   our current linux firewall have multiple interface and multiple
routing tables. local program will get lan ip address and nat to
correct wan ip address when goto internet.

  since wireguard can not bind to specific ip address, it sometimes
use wrong ip address to reply and the vpn communication can not be
established.

for example:

config for client site: (assume wan ip is 2.2.2.2)
interface: wg0
  public key: ****
  private key: (hidden)
  listening port: 51820
peer: ****
  endpoint: 1.1.1.1:51820
  allowed ips: 0.0.0.0/0

config for server site: (assume wan ip is 1.1.1.1)
interface: wg0
  public key: ****
  private key: (hidden)
  listening port: 51820
peer: ****
  allowed ips: 0.0.0.0/0

when client initial connect to server, at server site I saw  flow like below:
"cat /proc/net/nf_conntrack | grep 51820"

ipv4     2 udp      17 23 src=172.18.1.254 dst=2.2.2.2 sport=51820
dport=51820 packets=1 bytes=120 [UNREPLIED] src=2.2.2.2 dst=1.1.1.1
sport=51820 dport=1085 packets=0 bytes=0 mark=1 zone=0 use=2
ipv4     2 udp      17 23 src=2.2.2.2 dst=1.1.1.1 sport=51820
dport=51820 packets=1 bytes=176 [UNREPLIED] src=1.1.1.1 dst=2.2.2.2
sport=51820 dport=51820 packets=0 bytes=0 mark=1 zone=0 use=2

so at first client  2.2.2.2:51820 connect to server 1.1.1.1:51820
but then server use 172.18.1.254(lan ip address) to reply and 51820
port is nat to 1085 so the communication is broken.

if wireguard can bind to specific ip address then there will be no problem.
or if wireguard can reply with the correct ip address.( eg: if client
connect to wireguard ip 1.1.1.1, then wiregurad should reply via ip
address 1.1.1.1) then maybe there will be no problem.

Regards,
tbskyd

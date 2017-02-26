Return-Path: siosm99@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdd67cf8
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 19:45:43 +0000 (UTC)
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
 [209.85.128.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98338507
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Feb 2017 19:45:43 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id m5so20979635wrm.0
 for <wireguard@lists.zx2c4.com>; Sun, 26 Feb 2017 11:47:12 -0800 (PST)
Return-Path: <siosm99@gmail.com>
Received: from [0.0.0.0] (siosm.fr. [2001:41d0:1:d345::1])
 by smtp.gmail.com with ESMTPSA id j80sm11365364wmd.14.2017.02.26.11.47.09
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 Feb 2017 11:47:10 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?Q?Timoth=c3=a9e_Ravier?= <siosm99@gmail.com>
Subject: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with 00000100?
Message-ID: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>
Date: Sun, 26 Feb 2017 20:47:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

With the following setup, both client & server running:
* Arch Linux
* kernel 4.9.11.r201702222257-1-grsec
* wireguard-dkms & wireguard-tools 0.0.20170223

Server:
interface: wg0
  public key: ...
  private key: ...
  listening port: 51820

peer: ...
  endpoint: ...:51820
  allowed ips: 192.168.42.1/32

Client:
interface: wg0
  public key: ...
  private key: ...
  listening port: 51820

peer: ...
  endpoint: ...:51820
  allowed ips: 192.168.42.100/32

I get the following warning in the kernel log for each received packets
(a simple ping triggers it):
softirq: huh, entered softirq 3 NET_RX net_rx_action+0x0/0x760 with
preempt_count 00000101, exited with 00000100?

I am using nftables on the server side but iptables on the client side.

Thanks,

Tim

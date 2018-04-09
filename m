Return-Path: mikael@m7n.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67fac06f
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 20:38:08 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [46.246.28.121])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a24aa4f
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 20:38:07 +0000 (UTC)
Received: from reyes.m7n.se (unknown
 [IPv6:2001:470:dfae:1000:8c6f:5ca4:3600:9431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id A91126000AEB
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 20:51:47 +0000 (UTC)
Subject: Re: Working only one way
To: wireguard@lists.zx2c4.com
References: <1183404859.513012.1523305020741.JavaMail.zimbra@mtz.desoft.cu>
From: Mikael Magnusson <mikael.wg@m7n.se>
Message-ID: <6e6ae8f4-0fc4-2f9c-4ade-419da03bcd8d@m7n.se>
Date: Mon, 9 Apr 2018 22:51:47 +0200
MIME-Version: 1.0
In-Reply-To: <1183404859.513012.1523305020741.JavaMail.zimbra@mtz.desoft.cu>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



On 04/09/2018 10:17 PM, Ing. Luis Felipe Domínguez Vega wrote:
> Hello people, i currently installed wireguard (So easy !!!!!!), but i have a problem i have ping from server -> client, but not client -> server, when in server I execute tcpdump -i empresa only i see ICMP request and not response:
> 
> Config server:
> ************************************
> [Interface]
> Address = 10.11.2.0/24

This is the network address which I don't think you should use. Try any 
address within 10.11.2.0/24 except 10.11.2.0, 10.11.2.2, and 10.11.2.255.

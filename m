Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4F2C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0336A20735
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0336A20735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57df9e97;
	Mon, 30 Mar 2020 02:10:52 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 61caacbf
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Mar 2020 21:30:18 +0000 (UTC)
Received: from [98.128.186.71] (port=53398 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jHwfm-0002fR-Js; Fri, 27 Mar 2020 22:37:50 +0100
To: wireguard@lists.zx2c4.com
From: Tore Anderson <tore@fud.no>
Subject: wg syncconf changes endpoint to IPv4 and removes fwmark
Message-ID: <e8292a70-3ba7-61ee-469c-bacb4135553f@fud.no>
Date: Fri, 27 Mar 2020 22:37:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:42 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

While testing the patch I just sent, I stumbled across two bugs in wg syncconf:

1) The endpoint address is changed from IPv6 to IPv4 (harmless but unexpected).
2) The fwmark vanishes (harmful - the tunnel breaks completely).

The terminal log below should demonstrate these issues:

[:~] $ sudo cat /etc/wireguard/integrity.conf | sed 's/PrivateKey.*/<snip>/'
[Interface]
<snip>

Address = 10.0.237.73/24,fdab:1337:1337:237::73/64
DNS = 2001:9b1:8826::53, 2001:9b0:4:2601::53, 98.128.186.86, 155.4.89.136

[Peer]
PublicKey = ipW9/ysMc9vQbg/x7WK/udnl06+NJioWZZ4XIqz4PQY=
Endpoint = wireguard.5july.net:48574
AllowedIPs = 0.0.0.0/0, ::/0
[:~] $ sudo wg-quick up integrity
[#] ip link add integrity type wireguard
[#] wg setconf integrity /dev/fd/63
[#] ip -4 address add 10.0.237.73/24 dev integrity
[#] ip -6 address add fdab:1337:1337:237::73/64 dev integrity
[#] ip link set mtu 1420 up dev integrity
[#] mount `2001:9b1:8826::53 2001:9b0:4:2601::53 98.128.186.86 155.4.89.136' /etc/resolv.conf
[#] wg set integrity fwmark 51820
[#] ip -6 route add ::/0 dev integrity table 51820
[#] ip -6 rule add not fwmark 51820 table 51820
[#] ip -6 rule add table main suppress_prefixlength 0
[#] nft -f /dev/fd/63
[#] ip -4 route add 0.0.0.0/0 dev integrity table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
[#] nft -f /dev/fd/63
[:~] $ sudo wg
interface: integrity
  public key: s9okCVHLskAUeQPcV7f9ThS8qOcN5WmDb8zEdl+oOnY=
  private key: (hidden)
  listening port: 40813
  fwmark: 0xca6c

peer: ipW9/ysMc9vQbg/x7WK/udnl06+NJioWZZ4XIqz4PQY=
  endpoint: [2001:9b1:8826:0:98:128:186:112]:48574
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 8 seconds ago
  transfer: 43.33 KiB received, 46.32 KiB sent
[:~] $ sudo wg-quick strip integrity | sudo wg syncconf integrity /dev/stdin
[:~] $ sudo wg
[:~] $ sudo wg
interface: integrity
  public key: s9okCVHLskAUeQPcV7f9ThS8qOcN5WmDb8zEdl+oOnY=
  private key: (hidden)
  listening port: 50375

peer: ipW9/ysMc9vQbg/x7WK/udnl06+NJioWZZ4XIqz4PQY=
  endpoint: 98.128.186.71:48574
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 2 minutes, 9 seconds ago
  transfer: 558.95 KiB received, 205.80 KiB sent

The endpoint changed to IPv4 and the fwmark disappeared even though the config file did not change.

The tunnel as at this point broken, passing no traffic. 'wg set integrity fwmark 51820' revives it.

I am running Fedora 31 with the latest packages (v1.0.20200102) from the jdoss/wireguard COPR.

Tore

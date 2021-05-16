Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9C0C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:21:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A40A5610CB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A40A5610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b11e1b0c;
	Mon, 17 May 2021 15:21:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 771fada2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 May 2021 12:07:14 +0000 (UTC)
Received: from [192.168.0.214] ([95.222.31.178]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M4K2r-1lhyZH0WdF-000MHe for <wireguard@lists.zx2c4.com>; Sun, 16 May 2021
 14:07:14 +0200
To: wireguard@lists.zx2c4.com
From: Max Schulze <max.schulze@online.de>
Subject: wireguard-windows: Tunnel shown as active but never completed
 handshake
Message-ID: <cf987cbc-a5d7-106b-7dc3-382ced7bc5d0@online.de>
Date: Sun, 16 May 2021 14:07:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Provags-ID: V03:K1:BM9QtcgtNqhIiIzjvcb8ZMG2SioiRg1WyTkBbOQPZhA+pcZIEJt
 sf8wo17CMbZo5g1t+iuPC+kQqPbIijcj1J1DJgxe4JYFjT7+HKuD79EF8XbYZZOrQxU5Xp5
 m/CrhKl0ZEtfcJRuYBTcsejnk4abGl6jARJHjxHDZZx4exfD/WTRE6LtowL6visrFBCWeGb
 F6TDkLFbWKV27L+cmbO8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w6GXNnvyRG8=:IQmNWUbi3HxwYxMVEfNTvg
 Dog2/aG8kz2nysTEkYqKBN1AKBgbldfwEyff8sESk0CSNPpWI8toCVnLPfUpNA+g0KtVz6Rff
 ZXte41aibhsOIyI9t7YdnHgf268FJ+Uwi8arWCyb0lfRwDgeBJ/q0OYctKnG5D2Ig4OM2oS4Q
 fh7HbRaC4g89s5XpiIccUMXK1oFaw1+tqk6yOd36Nl9AkJyL1VmxoqqGhdQ3Sp3oIEZ/btqw8
 zUj2E3RIGB8dqxltOcmMROJOtrpk8lPCQ4TPfYZXJGHPhB3LDL49HipF/GG3vXvAso2xwDz+z
 PCrQ+YuxI9fiWmqR6DFTlfgdTxJqKRwg56o5YcSUkvRJvxq7OS2Ojt14rkY3wn87X5LcyZldz
 XDk7Frr2f7//5RagROG4fkoNEcTRetCXBOl4Q5cXSfNzFTUTtZ/Lg7oAfDNtCtrJxxv0JrwXM
 SZ36l1eUkwW37uPO+IGcx39YjjUjCxkyo/GHByrE4wPYwLVDCV8S1zHa4JdzfI92qgxChheJt
 qdbN3giOU6p6B56AaUnDUA=
X-Mailman-Approved-At: Mon, 17 May 2021 15:21:51 +0000
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

I am puzzled that the wireguard management UI shows "active", even 
though the tunnel is not established.


I know for sure the peer is reachable via ping, but does not have 
wireguard running. I am reproducing an issue where the peer went down 
but the tunnel on the client kept being displayed as "active".


Wouldn't it be better to show 'tunnel up - handshake in progress' or 
something similar and only switch to 'active' once there has been an 
handshake?


Can I provide more debug info?


Note: the wintun errors are there even when it works - I might report a 
separate Issue for them...


Best regards,

max



C:\Windows\system32>wg
interface: <>
   public key: QhK<scrambled>0=
   private key: (hidden)
   listening port: 65170

peer: 9npne1<scrambled>CDg=
   endpoint: 192.168.3.184:51820
   allowed ips: 192.168.223.0/24
   transfer: 0 B received, 10.12 KiB sent
   persistent keepalive: every 20 seconds


2021-05-15 18:34:53.501802: [MGR] [Wintun] WintunEnumAdapters: Failed to 
create adapter 2276 data
2021-05-16 13:48:04.114000: [TUN] [<>] Starting WireGuard/0.3.14 
(Windows 6.1.7601; amd64)
2021-05-16 13:48:04.114000: [TUN] [<>] Watching network interfaces
2021-05-16 13:48:04.114000: [TUN] [<>] Resolving DNS names
2021-05-16 13:48:04.114000: [TUN] [<>] Creating Wintun interface
2021-05-16 13:48:04.114000: [TUN] [<>] [Wintun] 
GetNetCfgInstanceIdFromDevInfo: Opening adapter 2276 device registry key 
failed: Der angeforderte Geräteregistrierungsschlüssel ist nicht 
vorhanden. (Code 0xE0000204)
2021-05-16 13:48:04.114000: [TUN] [<>] [Wintun] CreateAdapter: Creating 
adapter
2021-05-16 13:48:04.198000: [TUN] [<>] [Wintun] SelectDriver: Using 
existing driver 0.11
2021-05-16 13:48:04.660000: [TUN] [<>] Using Wintun/0.11
2021-05-16 13:48:04.660000: [TUN] [<>] Enabling firewall rules
2021-05-16 13:48:04.670000: [TUN] [<>] Dropping privileges
2021-05-16 13:48:04.670000: [TUN] [<>] Creating interface instance
2021-05-16 13:48:04.680000: [TUN] [<>] Setting interface configuration
2021-05-16 13:48:04.680000: [TUN] [<>] UAPI: Updating private key
2021-05-16 13:48:04.680000: [TUN] [<>] UAPI: Removing all peers
2021-05-16 13:48:04.680000: [TUN] [<>] peer(9npn…+CDg) - UAPI: Created
2021-05-16 13:48:04.680000: [TUN] [<>] peer(9npn…+CDg) - UAPI: Updating 
endpoint
2021-05-16 13:48:04.680000: [TUN] [<>] peer(9npn…+CDg) - UAPI: Updating 
persistent keepalive interval
2021-05-16 13:48:04.680000: [TUN] [<>] peer(9npn…+CDg) - UAPI: Removing 
all allowedips
2021-05-16 13:48:04.680000: [TUN] [<>] peer(9npn…+CDg) - UAPI: Adding 
allowedip
2021-05-16 13:48:04.680000: [TUN] [<>] Bringing peers up
2021-05-16 13:48:04.681000: [TUN] [<>] UDP bind has been updated
2021-05-16 13:48:04.681000: [TUN] [<>] peer(9npn…+CDg) - Starting
2021-05-16 13:48:04.681000: [TUN] [<>] peer(9npn…+CDg) - Sending 
keepalive packet
2021-05-16 13:48:04.681000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:04.681000: [TUN] [<>] peer(9npn…+CDg) - Routine: 
sequential receiver - started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: encryption worker 1 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: decryption worker 1 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: handshake worker 1 - started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: encryption worker 2 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: decryption worker 2 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: handshake worker 2 - started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: encryption worker 3 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: decryption worker 3 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: handshake worker 3 - started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: encryption worker 4 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: decryption worker 4 - 
started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: handshake worker 4 - started
2021-05-16 13:48:04.681000: [TUN] [<>] Routine: TUN reader - started
2021-05-16 13:48:04.687000: [TUN] [<>] Routine: event worker - started
2021-05-16 13:48:04.687000: [TUN] [<>] Interface state was Down, 
requested Up, now Up
2021-05-16 13:48:04.687000: [TUN] [<>] Monitoring default v4 routes
2021-05-16 13:48:04.687000: [TUN] [<>] Binding v4 socket to interface 11 
(blackhole=false)
2021-05-16 13:48:04.689000: [TUN] [<>] Routine: receive incoming v6 - 
started
2021-05-16 13:48:04.689000: [TUN] [<>] Routine: receive incoming v4 - 
started
2021-05-16 13:48:04.689000: [TUN] [<>] peer(9npn…+CDg) - Routine: 
sequential sender - started
2021-05-16 13:48:04.691000: [TUN] [<>] Setting device v4 addresses
2021-05-16 13:48:04.752000: [TUN] [<>] Monitoring default v6 routes
2021-05-16 13:48:04.752000: [TUN] [<>] Binding v6 socket to interface 0 
(blackhole=false)
2021-05-16 13:48:04.752000: [TUN] [<>] Setting device v6 addresses
2021-05-16 13:48:04.822000: [TUN] [<>] Listening for UAPI requests
2021-05-16 13:48:04.822000: [TUN] [<>] Startup complete
2021-05-16 13:48:09.957000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:09.957000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:13.991000: [MGR] [Wintun] CreateAdapterData: Opening 
adapter 2276 device registry key failed: Der angeforderte 
Geräteregistrierungsschlüssel ist nicht vorhanden. (Code 0xE0000204)
2021-05-16 13:48:13.991000: [MGR] [Wintun] WintunEnumAdapters: Failed to 
create adapter 2276 data
2021-05-16 13:48:15.126000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:15.126000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:20.407000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:20.407000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:25.584000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:25.584000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:30.842000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:30.842000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:36.044000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:41.132000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:41.132000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:46.324000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:51.464000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:51.464000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:48:56.605000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:48:56.605000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:01.854000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:06.975000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:12.056000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:12.056000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:17.165000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:17.165000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:22.242000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:22.242000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:27.340000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:27.340000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:32.355000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 3)
2021-05-16 13:49:32.355000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:37.450000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:37.450000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:42.531000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:42.531000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:47.840000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:47.840000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:53.065000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:49:53.065000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:49:58.275000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:03.341000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:50:03.341000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:08.626000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:50:08.626000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:13.946000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 3)
2021-05-16 13:50:13.946000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:19.156000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 4)
2021-05-16 13:50:19.156000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:24.287000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 5)
2021-05-16 13:50:24.287000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:29.350000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 6)
2021-05-16 13:50:29.350000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:34.640000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 7)
2021-05-16 13:50:34.640000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:39.912000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 8)
2021-05-16 13:50:39.912000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:45.153000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 9)
2021-05-16 13:50:45.153000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:50.245000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 10)
2021-05-16 13:50:50.245000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:50:55.309000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 11)
2021-05-16 13:50:55.309000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:00.553000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 12)
2021-05-16 13:51:00.553000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:05.714000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 13)
2021-05-16 13:51:05.714000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:10.835000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 14)
2021-05-16 13:51:10.835000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:15.996000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 15)
2021-05-16 13:51:15.996000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:21.221000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 16)
2021-05-16 13:51:21.221000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:26.417000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 17)
2021-05-16 13:51:26.417000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:31.673000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:51:31.673000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:36.739000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 3)
2021-05-16 13:51:36.739000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:41.796000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 4)
2021-05-16 13:51:41.796000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:46.865000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:51:46.865000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:51.969000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 3)
2021-05-16 13:51:51.969000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:51:57.275000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 4)
2021-05-16 13:51:57.275000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:02.465000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 5)
2021-05-16 13:52:02.465000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:07.777000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 6)
2021-05-16 13:52:07.777000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:12.994000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 7)
2021-05-16 13:52:12.994000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:18.219000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 8)
2021-05-16 13:52:18.219000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:23.398000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 9)
2021-05-16 13:52:23.398000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:28.674000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 10)
2021-05-16 13:52:28.674000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:33.856000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 11)
2021-05-16 13:52:33.856000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:39.128000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 12)
2021-05-16 13:52:39.128000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:44.265000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 13)
2021-05-16 13:52:44.265000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:49.490000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 14)
2021-05-16 13:52:49.490000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:54.761000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 15)
2021-05-16 13:52:54.761000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:52:59.766000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation
2021-05-16 13:53:04.937000: [TUN] [<>] peer(9npn…+CDg) - Handshake did 
not complete after 5 seconds, retrying (try 2)
2021-05-16 13:53:04.937000: [TUN] [<>] peer(9npn…+CDg) - Sending 
handshake initiation


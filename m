Return-Path: <SRS0=bcN2=E6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URI_NOVOWEL,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27789C63798
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 10:17:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2770520708
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 10:17:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xg8sVUUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2770520708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b46ebec2;
	Tue, 24 Nov 2020 10:11:44 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fabf7c2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 10:11:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id c198so1922646wmd.0
 for <wireguard@lists.zx2c4.com>; Tue, 24 Nov 2020 02:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0c5nkSUmT7Rhxx8ZE5lBWqSZi90WCzuLY3e7y4aIv64=;
 b=Xg8sVUUSgRfHNTKaApiGQakrRaBKPP1sd+nP33xbJeOENAMIDuZtnFO+UeK5V8NbfN
 YZBvNVbdQzQ58FU9bvfFkuwRom6w08+Bn2BPSyA0iF7zQLIBcDTN+HMTSLBD0Xx2eC+3
 h4Z4tWm4uzaJk128Ppb5A34eJVG4E0O5wkmT/hrqpRvNa7eleI5Pkf6/xIKJqL7D0O19
 vBqnrAAH0GmcfjTx97aCcY5qj0A7pltXvyFIxyxaFQwsgYU2/eMr6aN8V5Ji7fKoSYI1
 Q7oSFrD4k3Ovs+a4uOas0vASYdmsaKg0PRXBkowguo03B+fqso+Vw+yXpHW1149CwZMr
 Qsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0c5nkSUmT7Rhxx8ZE5lBWqSZi90WCzuLY3e7y4aIv64=;
 b=FHDzIYQ73bKjUcT17ziG8pW93yuRZHBPY6Uyg7SYb24Nw+QG98H1w0Jklo5XqivbMt
 y+RPDDGBwLcjZQbBRj9gnVqxppjlHeY/kyAnh1El0YVClW9rvdOm0eU4Mxf2/1uI6mSt
 ulg2OvVYL2EyFI7srZbNVJ9nwKQy8rm9TBn80uqtmbKMHAnr734OeEg+fJls/4YmLtx/
 uTnj0FJtkafUNJlgAo32STsDsjJKTzPqLAOdHMkBSyc+emx/JnNJa/oRxh05tc8gIrzN
 Lg57oddAM3bomSBNPgJ+S1zwMiPK6zdALtKZjI76Js3YZTuu3aW2EtWP5Omrv+J2mJhX
 gTNQ==
X-Gm-Message-State: AOAM533sxEwtQfjHK5EARcWW0NoDxIBvpGokinusiNUAmqTz+DLc2AZg
 ZVmOnheBF/zv0wZdilkGGeKtb99nRCfeThowr8Y=
X-Google-Smtp-Source: ABdhPJwU7lYW1EnGoouXoU0B02TBe7AIsAba4B/KXebBapXfV6N93Mj2yz+CU3Ix3CoeGhHeKolNow==
X-Received: by 2002:a7b:cf26:: with SMTP id m6mr3646920wmg.121.1606213030901; 
 Tue, 24 Nov 2020 02:17:10 -0800 (PST)
Received: from [192.168.25.203] ([31.127.152.168])
 by smtp.gmail.com with ESMTPSA id q12sm24248474wrx.86.2020.11.24.02.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:17:10 -0800 (PST)
Subject: Re: Problems with Windows client
From: Peter Whisker <peter.whisker@gmail.com>
To: Simon Rozman <simon@rozman.si>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <69672027-558a-7ae4-484f-8d7573b3cf1b@gmail.com>
 <CAHmME9rZnXAZ9LmQBbegaS=h-05=utUWkKNEzDDJxnzUo6pYUQ@mail.gmail.com>
 <b556392b-fb2c-7a40-e6a9-c36610237fd6@gmail.com>
 <74df5880ee38427a86019f7a36788a34@rozman.si>
 <2718d8de-42a1-00dc-2932-a4d253d33423@gmail.com>
Message-ID: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
Date: Tue, 24 Nov 2020 10:17:09 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2718d8de-42a1-00dc-2932-a4d253d33423@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

Hi

I've taken a futher look at this today with the latest client 0.3.1. The 
issue is establishing a wireguard connection over a PulseConnect SSLVPN.

The Tunsafe client which works (I'm using an identical configuration on 
both it and the Wireguard client) exchanges handshakes and then 
Keepalives and then starts transporting packets.

My source address is 10.209.29.xxx and my destination address is 
158.xxx.xxx.xxx. The config is as below.

After Tunsafe starts I see the routing created as:

C:\Users\whiskerp>route print /4 | find "10.2.80.226"
         10.2.0.34  255.255.255.254        10.2.80.1 10.2.80.226    125
         10.2.1.34  255.255.255.254        10.2.80.1 10.2.80.226    125
         10.2.80.0    255.255.255.0         On-link 10.2.80.226    281
       10.2.80.226  255.255.255.255         On-link 10.2.80.226    281
       10.2.80.255  255.255.255.255         On-link 10.2.80.226    281
         10.12.0.0    255.255.254.0        10.2.80.1 10.2.80.226    125
         224.0.0.0        240.0.0.0         On-link 10.2.80.226    281
   255.255.255.255  255.255.255.255         On-link 10.2.80.226    281

Wireguard client starts and exchanges handshakes, sends a keepalive but 
it does not seem to get to the other end. After 25 seconds, a Keepalive 
is sent by the other end (and noted by Wireguard at 10:04:41 in the 
log). No traffic is sent.

The routing table created by Wireguard is slightly different too:

C:\Users\whiskerp>route print /4 | find "10.2.80.226"
         10.2.0.34  255.255.255.254         On-link 10.2.80.226      5
         10.2.0.35  255.255.255.255         On-link 10.2.80.226    261
         10.2.1.34  255.255.255.254         On-link 10.2.80.226      5
         10.2.1.35  255.255.255.255         On-link 10.2.80.226    261
         10.2.80.0    255.255.255.0         On-link 10.2.80.226      5
       10.2.80.226  255.255.255.255         On-link 10.2.80.226    261
       10.2.80.255  255.255.255.255         On-link 10.2.80.226    261
         10.12.0.0    255.255.254.0         On-link 10.2.80.226      5
       10.12.1.255  255.255.255.255         On-link 10.2.80.226    261

Configuration:

[Interface]
PrivateKey = xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
Address = 10.2.80.226/32

[Peer]
PublicKey = QfjlPwEQa03gx7OYkM3Al8MIrfTx7WY0TT235eg0V1w=
PresharedKey = yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy=
AllowedIPs = 10.2.80.0/24, 10.12.0.0/23, 10.2.0.34/31, 10.2.1.34/31
Endpoint = iris-fw1.xxxxxxxxxx.com:21820
PersistentKeepalive = 25

I can connect with Wireguard to another server across the direct 
interface just not via the PulseConnect SSLVPN. Tunsafe works in both cases.

The log is below. I do not see any repeated Handshakes in a Wireguard 
capture of all interfaces, just the first one and the one 25 seconds 
later from the remote side.

2020-11-24 10:03:45.801982: [TUN] [lhirisseccom01] Starting 
WireGuard/0.3.1 (Windows 10.0.18363; amd64)
2020-11-24 10:03:45.803758: [TUN] [lhirisseccom01] Watching network 
interfaces
2020-11-24 10:03:45.809030: [TUN] [lhirisseccom01] Resolving DNS names
2020-11-24 10:03:45.841602: [TUN] [lhirisseccom01] Creating Wintun interface
2020-11-24 10:03:46.003480: [TUN] [lhirisseccom01] [Wintun] 
CreateAdapter: Creating adapter
2020-11-24 10:03:48.023642: [TUN] [lhirisseccom01] Using Wintun/0.9
2020-11-24 10:03:48.069741: [TUN] [lhirisseccom01] Enabling firewall rules
2020-11-24 10:03:48.161811: [TUN] [lhirisseccom01] Dropping privileges
2020-11-24 10:03:48.165901: [TUN] [lhirisseccom01] Creating interface 
instance
2020-11-24 10:03:48.171574: [TUN] [lhirisseccom01] Routine: event worker 
- started
2020-11-24 10:03:48.174280: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.175675: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.178308: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.179950: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.180986: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.181626: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.185430: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.185934: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.186070: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.187147: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.190237: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.194832: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.196508: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.197094: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.198466: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.199475: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.199475: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.200682: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.201256: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.203447: [TUN] [lhirisseccom01] Routine: encryption 
worker - started
2020-11-24 10:03:48.205727: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.208147: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.209167: [TUN] [lhirisseccom01] Routine: handshake 
worker - started
2020-11-24 10:03:48.210297: [TUN] [lhirisseccom01] Routine: decryption 
worker - started
2020-11-24 10:03:48.211810: [TUN] [lhirisseccom01] Routine: TUN reader - 
started
2020-11-24 10:03:48.216323: [TUN] [lhirisseccom01] Setting interface 
configuration
2020-11-24 10:03:48.224604: [TUN] [lhirisseccom01] UAPI: Updating 
private key
2020-11-24 10:03:48.230859: [TUN] [lhirisseccom01] UAPI: Removing all peers
2020-11-24 10:03:48.238534: [TUN] [lhirisseccom01] UAPI: Transition to 
peer configuration
2020-11-24 10:03:48.253111: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Created
2020-11-24 10:03:48.257120: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating preshared key
2020-11-24 10:03:48.257692: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating endpoint
2020-11-24 10:03:48.363693: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Updating persistent keepalive interval
2020-11-24 10:03:48.369795: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Removing all allowedips
2020-11-24 10:03:48.401343: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-11-24 10:03:48.410717: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-11-24 10:03:48.412264: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-11-24 10:03:48.412364: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
UAPI: Adding allowedip
2020-11-24 10:03:48.414098: [TUN] [lhirisseccom01] Bringing peers up
2020-11-24 10:03:48.421934: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv6 - started
2020-11-24 10:03:48.423727: [TUN] [lhirisseccom01] Routine: receive 
incoming IPv4 - started
2020-11-24 10:03:48.427885: [TUN] [lhirisseccom01] UDP bind has been updated
2020-11-24 10:03:48.428445: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Starting...
2020-11-24 10:03:48.430048: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential receiver - started
2020-11-24 10:03:48.432758: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: sequential sender - started
2020-11-24 10:03:48.434497: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending keepalive packet
2020-11-24 10:03:48.439271: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Routine: nonce worker - started
2020-11-24 10:03:48.439271: [TUN] [lhirisseccom01] Monitoring default v6 
routes
2020-11-24 10:03:48.440310: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:03:48.444410: [TUN] [lhirisseccom01] Binding v6 socket to 
interface 0 (blackhole=false)
2020-11-24 10:03:48.448834: [TUN] [lhirisseccom01] Setting device v6 
addresses
2020-11-24 10:03:48.484249: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Awaiting keypair
2020-11-24 10:03:48.501366: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Received handshake response
2020-11-24 10:03:48.505199: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Obtained awaited keypair
2020-11-24 10:03:49.717724: [TUN] [lhirisseccom01] Monitoring default v4 
routes
2020-11-24 10:03:49.735153: [TUN] [lhirisseccom01] Binding v4 socket to 
interface 23 (blackhole=false)
2020-11-24 10:03:49.736441: [TUN] [lhirisseccom01] Setting device v4 
addresses
2020-11-24 10:03:51.221490: [TUN] [lhirisseccom01] Listening for UAPI 
requests
2020-11-24 10:03:51.225480: [TUN] [lhirisseccom01] Startup complete
2020-11-24 10:04:08.258064: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Retrying handshake because we stopped hearing back after 15 seconds
2020-11-24 10:04:08.260207: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:13.543272: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-11-24 10:04:13.545765: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:15.196489: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Receiving keepalive packet
2020-11-24 10:04:18.799504: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 3)
2020-11-24 10:04:18.801789: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:23.881986: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 4)
2020-11-24 10:04:23.883677: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:29.189703: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 5)
2020-11-24 10:04:29.191775: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:32.339743: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Retrying handshake because we stopped hearing back after 15 seconds
2020-11-24 10:04:34.334302: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 2)
2020-11-24 10:04:34.336489: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:39.477027: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying (try 3)
2020-11-24 10:04:39.477590: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Sending handshake initiation
2020-11-24 10:04:41.821019: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Receiving keepalive packet

2020-11-24 10:04:44.741589: [TUN] [lhirisseccom01] peer(Qfjl…0V1w) - 
Handshake did not complete after 5 seconds, retrying

This is very strange.

Thanks

Peter


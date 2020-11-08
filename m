Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECDCC63697
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B4C206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=westermo.com header.i=@westermo.com header.b="BGPQ+98O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B4C206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=westermo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 383de108;
	Mon, 23 Nov 2020 21:18:08 +0000 (UTC)
Received: from mx07-0057a101.pphosted.com (mx07-0057a101.pphosted.com
 [205.220.184.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 421021ca
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Nov 2020 21:57:05 +0000 (UTC)
Received: from pps.filterd (m0214197.ppops.net [127.0.0.1])
 by mx07-0057a101.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A8Lw8Lq022065
 for <wireguard@lists.zx2c4.com>; Sun, 8 Nov 2020 23:00:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com;
 h=to : from : subject
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=12052020;
 bh=YAr/geCHBNViuDfYzrHvHVHoB2VqjnvzusOdah+lm2c=;
 b=BGPQ+98OGCcrAoPoLFgcwdsVll2VRMYQZlQPEubvKm3mOi/j4oleoUCtvolWb8RvePO5
 YzrWDPcb37P3wLPdvtx5NIQdSMT6Sl1tHVZIXJiWEIpurDu592IyVd3yCwYq02ELSqSd
 5ZSunbMEHu4F9fyKZrxHoGBY5e9yfnGThYEAUK9aZ8M7Jl9Izk5FNHvIMB0I37+QDWHs
 +ikEQosB2Zn/eY3wKa5l6g8prwPnZYd5cNuTxGG7scO2YOgoMffc5fvwkyCTc0u2BNIE
 cxWyUn4neXOV+KGQZiM+yH3AZqpwe2E5vw0m5Rz5TxtMoybJb4tfAaXIv2FsT+NcaC4h uQ== 
Received: from mail.beijerelectronics.com ([195.67.87.132])
 by mx07-0057a101.pphosted.com with ESMTP id 34ngtg1bk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Sun, 08 Nov 2020 23:00:33 +0100
Received: from wsests-s0004.westermo.com (192.168.10.12) by
 EX02GLOBAL.beijerelectronics.com (10.101.10.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.1847.3; Sun, 8 Nov 2020 23:00:32 +0100
Received: from [10.0.11.179] (172.29.100.2) by wsests-s0004.westermo.com
 (192.168.10.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.1847.3; Sun, 8 Nov
 2020 23:00:31 +0100
To: <wireguard@lists.zx2c4.com>
From: Matthias May <matthias.may@westermo.com>
Autocrypt: addr=matthias.may@westermo.com; keydata=
 mDMEX4AtKhYJKwYBBAHaRw8BAQdA2IyjGBS2NbuL0F3NsiMsHp16B5GiXHP9BfSgRcI4rgK0
 KE1hdHRoaWFzIE1heSA8bWF0dGhpYXMubWF5QHdlc3Rlcm1vLmNvbT6IlgQTFggAPhYhBHfj
 Ao2HgnGv7h0n/d92tgRTPA2+BQJfgC0qAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4B
 AheAAAoJEN92tgRTPA2+J/YBANR7Q1w436MVMDaIOmnxP9FimzEpsHorYNQfe8fp4cjPAP9v
 Ccg5Qd3odmd0orodCB6qXqLwOHexh+N60F8I0TuTBbg4BF+ALSoSCisGAQQBl1UBBQEBB0CU
 u0gESJr6GFA6GopcHFxtL/WH7nalrP2NoCGTFWdXWgMBCAeIfgQYFggAJhYhBHfjAo2HgnGv
 7h0n/d92tgRTPA2+BQJfgC0qAhsMBQkJZgGAAAoJEN92tgRTPA2+IQoA/2Vg2VE+hB5i4MOI
 PWGsf80E9zA0Cv/489ps7HaHFuSzAQCm8MVuy6EsMIBXQ84nTb0anpfLHCQMsRNMuW/GkELh CA==
Subject: "roaming" between source ports does not work
Message-ID: <d8f3a1a9-1f5e-ce1e-06c7-5aab45396d97@westermo.com>
Date: Sun, 8 Nov 2020 23:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.29.100.2]
X-ClientProxiedBy: wsevst-s0023.westermo.com (192.168.130.120) To
 wsests-s0004.westermo.com (192.168.10.12)
X-Mailman-Approved-At: Mon, 23 Nov 2020 22:18:06 +0100
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

== Premise
* I've recently implemented support for wireguard in our LTE-router.

== Source Environment
* The basis is OpenWRT.
* Used versions:
* On the client/initiator:
 * wg
  * 1.0.20200908
  * ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9
 * wg-tools
  * 1.0.20200827
  * 51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd
* On the server/responder:
 * Debian stretch (9.13), installed from repository
 * deb http://deb.debian.org/debian/ unstable main
 * # wg --version
 * wireguard-tools v1.0.20200827
 * I don't really know what the version of the build dkms is

== Issue
* We've implemented an automated test that seems to have a problem.
 * Each night, the device is configured to connect to the debian box.
  * This works fine the first time.
  * However it doesn't work anymore after this first time.

== Observerion
When the "client" connects the first time, wg-output on the "server"
looks like this:
> interface: wg1
>   public key: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
>   private key: (hidden)
>   listening port: 51821
>
> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>   endpoint: 172.29.42.230:38442
>   allowed ips: 10.0.41.3/32
>   latest handshake: 44 seconds ago
>   transfer: 8.01 MiB received, 7.96 MiB sent

and on the "client:
> interface: wg1
>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>   private key: (hidden)
>   listening port: 38442
>
> peer: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
>   endpoint: 172.29.60.13:51821
>   allowed ips: 10.0.41.0/24
>   latest handshake: 1 minute, 3 seconds ago
>   transfer: 187.06 KiB received, 189.96 KiB sent

Ports and IPs match, everything works.

However on the second run of the test:
On the "server" still:
> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>   endpoint: 172.29.42.230:38442
>   allowed ips: 10.0.41.3/32
>   latest handshake: 4 minutes, 52 seconds ago
>   transfer: 8.05 MiB received, 7.99 MiB sent

But the "client" shows:
> interface: wg1
>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
>   private key: (hidden)
>   listening port: 47858

The client device has been restarted in between.

Since the listen-port is set to 0, it obviously has now a new,
different, source-port.
The server doesn't pick this up.
Since peers may roam between IPs, i was under the impression, that it
would also roam between ports.


Is this working as intended?
If yes: How should the configuration look like to support clients doing
a power-cycle?


I'm aware, that i could set a static port on the client, but this won't
work when going through NAT with port-scrambling.
So i don't really have control over the source-port of the connection
anyway.
I suppose this would also apply when a router/firewall inbetween has
some aggressive killing of states where the keepalive is not fast
enough, and source-port scrambling is done.

But the main usecase i'm looking at here is: restart of a device.

BR
Matthias

Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17605C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 13:46:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1ED61101
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 13:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE1ED61101
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5010fc05;
	Wed, 3 Nov 2021 13:46:12 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 258b8022
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:To:Subject:From:MIME-Version:Date:Message-ID;
 bh=fiuC0DfawgWFRO4QyzrDGqYf7Vx70ZwX7ji0zgu01sw=; 
 b=DjgZzA+bHPKcFYfKwObeECUmwdKwNrYSmmZ0qy0PdOWeTetYaWbP80C1SOYqfAcMQ6FyFITbd1mT6LfLruWoqJbrCveJDf7J8ucS3Tn7FsPbEdzOSGGdeo7DUTxrPNmI0nuoQ+JJY2UkSPvGrVP3x3TmXbib69kLw8AL2Oep1aQ=;
Received: from [10.5.44.225] (port=16617 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1miGaW-00023x-0B
 for wireguard@lists.zx2c4.com; Wed, 03 Nov 2021 14:46:00 +0100
Received: from [10.242.2.2] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Wed, 3 Nov 2021 14:45:59
 +0100
X-CTCH-RefID: str=0001.0A682F16.61829298.003D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <1da52141-2cca-9ebb-e415-af471b14e74e@chil.at>
Date: Wed, 3 Nov 2021 14:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
From: Christoph Loesch <wireguard-mail@chil.at>
Subject: WireGuard connection without interface-address / linknet
To: <wireguard@lists.zx2c4.com>
Content-Language: de-AT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.5.44.244]
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

Hi,

(mail resent without URLs, because it got filtered by moderation)

I am using WireGuard on an OpenWRT VM as server for clients basically to reach the server's internal LAN at 10.5.44.0/24

As clients I currently use different WireGuard implementations like:
- Ubiquiti EdgeRouter (EdgeOS v2 based on Debian/stretch) with package from github/WireGuard/wireguard-vyatta-ubnt
- Mikrotik RouterOS v7.1 with Mikrotik own (at the moment beta) implementation
- Windows 10 Client from wireguard website

Server config looks like this:

config interface 'wg0'
         option proto 'wireguard'
         option private_key 'cNT...8Hc='
         option listen_port '51820'
         list addresses '172.27.0.1/16'
config wireguard_wg0
         option description 'router-test'
         option public_key 'qT5...YGo='
         option preshared_key 'Dle...ozI='
         option persistent_keepalive '25'
         option route_allowed_ips '1'
         list allowed_ips '172.27.34.28/32'
         list allowed_ips '10.34.28.0/24'

Client config looks like this:

[Interface]
PrivateKey = mDk...uVs=
Address = 172.27.34.28
[Peer]
PublicKey = 1sy...IkU=
PresharedKey = Dle...ozI=
AllowedIPs = 172.27.0.1/32,10.5.44.0/24
Endpoint = server.mydomain.at:51820
PersistentKeepalive = 25

Clients should just be able to reach the server's 10.5.44.0/24 subnet and this subnet should be able to reach clients at (in this one example) 10.34.28.0/24
Now this works all well as expected but I would like to omit using the 172.27.* addresses/linknet if possible because I dont really need/use this as it is only defined for the WireGuard tunnel itself.

On the EdgeRouter this also works perfectly fine if I remove the 172.27.* address on both sides. It is still possible to reach the other end repestively.
On the Mikrotik device and on the Windows client (using exact same configuration) it does not work as soon as I remove just the 172.27. address/linknet from configuration.
(I didn't test other clients yet)

I guess on the EdgeRouter this works because I set: set interfaces wireguard wg0 **route-allowed-ips true** - so the corresponding routes are added.
The Mikrotik device and the Windows client do not offer such an option, so those routes have to be added manually I guess?
But why does that work "out of the box" as soon as I add any linknet (172.27.* in my example) for the tunnel itself to the configuration?

Is this a fault in the implementation and I should file a bug report or is that expected that way?

(it's not a big issue using the linknet, I am just curious and would like avoid using it if it is not neccessarily required)

Thanks for any thoughts and kind regards,
Christoph

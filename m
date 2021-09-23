Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEB9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 16:10:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D465761050
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 16:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D465761050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dumke.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac0e08f7;
	Thu, 23 Sep 2021 15:56:29 +0000 (UTC)
Received: from www492.your-server.de (www492.your-server.de [188.40.218.17])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b5dbe1f0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 10:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dumke.me;
 s=default_1807; h=Content-Type:MIME-Version:Message-Id:To:Subject:From:Date:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References; bh=A3NN/GPVnUrbgfxGOl7pzCGRnT3wgmkZ6i0D1DiRcJo=; b=mN
 plJmgAKXm35kWS0p4d76bWUDjryezUMF8Y/kUvToqBr097UtO2P2ayXTv9AC2YQdMeIlShxUL6DI0
 tHSi6wo7EWOY5+eGaxIHL7bEbzoQwbFDikotxpk69l5/fjqzBihEE4glfl1+4RgX2Ktk2qknqbFMx
 SyjSvYDl8ZGAU/2iyC6UlC8Qh2h1fe2J0ywCVMC6v3Tb4lSP4aX9rmK3Oq8F5asw9C4sOG3seySJZ
 f7tu6GNQjeHtD2S+Ayxoy/v/+KC+89nRvEyC1mLhT2XBZ2FMhLh05iswYE3fxneBxDpgorqoB9Pr+
 CFi6MwIAjIKs+eDka5Ha3KLd9DSYtsyg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www492.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@dumke.me>) id 1mTMGX-00035T-Bl
 for wireguard@lists.zx2c4.com; Thu, 23 Sep 2021 12:47:45 +0200
Received: from [178.201.161.10] (helo=[10.0.2.57])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@dumke.me>) id 1mTMGX-000K4q-4v
 for wireguard@lists.zx2c4.com; Thu, 23 Sep 2021 12:47:45 +0200
Date: Thu, 23 Sep 2021 12:47:38 +0200
From: Daniel Dumke <daniel@dumke.me>
Subject: Wireguard massive amount data
To: wireguard <wireguard@lists.zx2c4.com>
Message-Id: <EBVVZQ.U9BF94AEV1NE@dumke.me>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Authenticated-Sender: daniel@dumke.me
X-Virus-Scanned: Clear (ClamAV 0.103.3/26301/Thu Sep 23 11:06:09 2021)
X-Mailman-Approved-At: Thu, 23 Sep 2021 15:56:28 +0000
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

I am trying to connect to a Mullvad Wireguard Host with my Fedora Linux 
using nmcli, as soon as I up the connection (nmcli con up Mullvad) 
massive amounts of data are sent through the tunnel (according to wg 
1.4 GiB in the first 20 secs).

Any hints on why this huge amount of data is transfered?

Daniel

'''
root@lenovo# wg
interface: wg1
  public key: zr0q0pxcOfSoiKWjXEfuHqM58GMjE4HBLr8FzQIHYxM=
  private key: (hidden)
  listening port: 40360
  fwmark: 0xcbdf

peer: C2TUHPoZlT08iceLM2coBDTbcfg9tTKrUt7tRBWP0nk=
  endpoint: 45.8.223.195:51820
  allowed ips: 0.0.0.0/0, ::/0
  latest handshake: 20 seconds ago
  transfer: 4.23 KiB received, 1.39 GiB sent
  persistent keepalive: every 33 seconds


root@lenovo# route
Kernel IP Routentabelle
Ziel            Router          Genmask         Flags Metric Ref    Use 
Iface
default         _gateway        0.0.0.0         UG    50     0        0 
wg1
default         _gateway        0.0.0.0         UG    600    0        0 
wlp0s12f0
_gateway        0.0.0.0         255.255.255.255 UH    20050  0        0 
wg1
10.0.2.0        0.0.0.0         255.255.255.0   U     600    0        0 
wlp0s12f0
192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 
virbr0


'''



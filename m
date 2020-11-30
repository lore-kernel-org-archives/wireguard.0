Return-Path: <SRS0=v8Vx=FE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23458C64E7B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:59:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E002E207BC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="pqaViG1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E002E207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74aca965;
	Mon, 30 Nov 2020 11:53:16 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 06b6aa9b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1606737571;
 bh=8ThqOo/cud+uhrAlfTSAQDMFpJQqOs3E436192kCkHA=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=pqaViG1gCrERiMBlNbzoS8mOmyGAoyrkYk09hgkdOpL0TFfWrdt+Ls1twKDB66DLA
 Kv142F+Sionvwl0lPTS4MM1mNv4bjyR9JUU6cKJ7dG2VrjFhlkl4Tp0/7A/SBaEMXp
 irme1ENtxX8u+zRpD1f+Ffrr+xY04JkM9v7v5aBE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [159.253.115.28] ([159.253.115.28]) by web-mail.web.de
 (3c-app-webde-bap19.server.lan [172.19.172.19]) (via HTTP); Mon, 30 Nov
 2020 12:59:31 +0100
MIME-Version: 1.0
Message-ID: <trinity-5cd63ac0-141c-4e6e-b0c5-23c3c1268e14-1606737571632@3c-app-webde-bap19>
From: Henning Ryll <henning.ryll@web.de>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard on multi user windows ?
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Nov 2020 12:59:31 +0100
Importance: normal
Sensitivity: Normal
Content-Transfer-Encoding: quoted-printable
X-Priority: 3
X-Provags-ID: V03:K1:PYGBEnfyPblmipYtt7BFylb25M4cOG60mnoMBJcptukm0CeUG+KozleGjO2ojSQE3/vZd
 03AIikUDNvF27MmAMXJR04HCTZH5VAsu/D5XsXMvJ2IErY1v5Yf981li+0B/hllrzVqUjM3UKp/a
 0Ua8T2MFWfRsRX50WaDFtuFD5crB2rw6+7DdSTapBIc8TK/lCUTNJ4hkDCnPRQptwsjGpO2lThwB
 Pu8fBFUxCFLj/Q76lRb4W+/Ezacp1H1yFsbUANsIgE2LfHlShTgIc8X/qVxbmx3XeEthaTt0+CSA
 b8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:BkAUUZSpbD8=:FEP+Q8uRuGocRJlyq5QDc/
 MPeo63mb4tLITSDZA5wTi0fLtvsPZh/F9mdZ52wy3UV9h+kI07J42bQZhCJM2Hr/Ledrdl9Px
 PkAveb3mxYtPDJpxjuKdjnMzbQDNXcjebRvWwD5BErDK+iQJMJ9yzWdLBW9XU2SV029mc6stC
 MIt8Vww4e3AnFBHtXj97uRUODgDubsWEAuWuitBVsDx5301PqvBYGybrjAw964X0oaLruhhtf
 Af+mS5X5IUKcRrv1dx9KFi6c0ws8npRVpBYl5RjKTTwVWdzSS50rJeZRHTMeR+Z+0PT6OQpbi
 UIsLK9ywLVGdSO/QOR+Z2bhFvzcJnp1PRnVl0Yi7vU7b+HtLSaZtBYZDe6UhuWh2IqtjfyiWg
 i79tfAXtlK/KH8qK9br/xiXMxe4Q4TcKEvl6K2PpQiMTfTj7TIYSwXcpYEFMw6iDBQj95MWsl
 IBOiQ2o3Q6AONdeNGgtvacJ2la94pFrBcQk7gsfaTUU2LgTRa4yoJqOfYw0Hyum+Ts0vsj+WS
 zPbLg9IUOGsTvKHKC3QWF6Kaxu/XDveMf2xajuIdadKKnK7Z+g9CwLQHjmsNf6jhQT+CMKaEB
 5WgFiQT26Ptyc=
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

Hello,

@Simon
please read careful and don't interpret =2E=2E=2E
I never wrote that I'm using a company laptop=2E There are only desktop ma=
chines in my company=2E
=C2=A0
And I know half a dozen people with the same problem=2E
They own small company's with only 2 to 5 employees=2E They are willing to=
 allow homework, at least during covid-19=2E
But they did not have the money to buy additional hardware, or even a comp=
lete VPN solution=2E

So I see wireguard will be no solution for them in near future=2E

And OpenVPN is even no real solution, like Jason described=2E=2E=2E
But for the moment is's better then nothing=2E I can only hope that other =
users are not running any background services after a reboot=2E

Regards
Henning

Return-Path: <SRS0=rROn=AC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92446C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 10:36:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80A7C21582
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 10:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80A7C21582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2caf398;
	Sun, 21 Jun 2020 10:17:38 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebdc5b8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 10:17:35 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=53106 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jmxKZ-00014p-FZ; Sun, 21 Jun 2020 12:36:07 +0200
Message-ID: <3d0d73fca0fea89a061897851ee63719fc633030.camel@fud.no>
Subject: Re: [PATCH] wg-quick: add restart command
From: Tore Anderson <tore@fud.no>
To: Garrit Franke <garritfranke@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Light <eric@ericlight.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sun, 21 Jun 2020 12:36:06 +0200
In-Reply-To: <CAD16O87AEvaP3Y0TKPvrps=MVdzw-34+=rBOmF_c7s=Eu9kSQw@mail.gmail.com>
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
 <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
 <322460e57138ccee828957de4320ca65cbd54631.camel@fud.no>
 <CAD16O87AEvaP3Y0TKPvrps=MVdzw-34+=rBOmF_c7s=Eu9kSQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

* Garrit Franke

> Do we have an alternative for non-systemd users?

My patch ought to work just fine for non-systemd users. Example usage:

$ wg-quick reload wg0

Try it out and let me know if it works fine for you?

Tore


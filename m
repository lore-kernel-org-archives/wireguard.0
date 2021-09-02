Return-Path: <SRS0=tDKf=NY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1ED3C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 06:48:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF2BA60FC0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Sep 2021 06:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF2BA60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e2f54b2;
	Thu, 2 Sep 2021 06:48:53 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a27976f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Sep 2021 06:48:50 +0000 (UTC)
Date: Thu, 02 Sep 2021 06:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1630565329;
 bh=rin/uVT1tOyW4OXLOzLnH42Us6MsZmY+7N2CB0Ze3tQ=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=wwm/6isqHeHyksv3/Nf0GEggzZ2oRif+bzDtGMDh9yXFJAsTwrB+1+1GSxqZmRP68
 I+s1A0OUnuKkp5LVH1puNkDfRLGIqnzrbDM7SvGPW81g5bmNte4ONhyyk+7mDA5LuH
 5cHum0FlHwtgMz1X95It71dT5TYuH3/9THHBoMQM=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Neutron <dotneutron@protonmail.ch>
Subject: [wireguard-apple] [iOS] Running WireGuard on a simulator
Message-ID: <4hMWm75HKpodCnXIg9XhHltxE-7XSQVijaKMwRC5XcKpdTEWnZ9Vn4TtWr4k1EdAMbBMMMS4BBPrvNhoisXG-oQLUj_3jErUO76UBfjM2ZY=@protonmail.ch>
In-Reply-To: <CAH8yC8nHSHg=rNaXRxjX_LdbGZEFBb+gB6TJkMVkw-cRO-nf-g@mail.gmail.com>
References: <-_8oxop6VI5mP0UY_0vydSMUBInbj0hR4IUPDWshTaRG0-6O9ybfu6kzIAk68XdY9N-LHiVgaiWhNQw6-iYG1cR14pfODj2o5JMStY-75ns=@protonmail.ch>
 <CAH8yC8nHSHg=rNaXRxjX_LdbGZEFBb+gB6TJkMVkw-cRO-nf-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Neutron <dotneutron@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Jeff, thank you for the clarification on how a simulator operates compared =
to an
emulator. The difference was certainly blurry in my head. I did a little mo=
re
digging and it turns out

GOOS_iphonesimulator :=3D ios

is not required when targeting an iOS12.0 simulator. I had initially run it=
 with
iOS14.5. Perhaps this line can be useful in the Makefile once the project's=
 iOS
version gets bumped. Still, I would like to know why this happens.

Just like before on iOS14.5, I'm having issues with creating/editing
configurations in the simulator, with log messages like:

Saving configuration failed: Error Domain=3DNEVPNErrorDomain Code=3D5 "IPC =
failed"

The message I'm getting may be just as well be unrelated, but a common them=
e I'm
seeing is that you can't get Network Extension providers to work on simulat=
ors.
This Eskimo fellow seems to have good insight on the matter.

https://developer.apple.com/forums/thread/46004?answerId=3D134358022#134358=
022

If it really can't run on a simulator at the moment, perhaps it would be us=
eful
for other tinkerers to see this mentioned somewhere in the README with a br=
ief
reasoning attached. It would be a time saver, especially for those of us wh=
o are
not iOS hackers.

Neutron

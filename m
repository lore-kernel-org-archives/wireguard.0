Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58B7C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:31:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C2EF212CC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="BOLf4GPJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tHs3/I3H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C2EF212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b80339;
	Wed, 17 Jun 2020 08:13:06 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 19842fcb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:13:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 948685F4;
 Wed, 17 Jun 2020 04:31:06 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Wed, 17 Jun 2020 04:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=t72rFkrDJhyZI49nYs3HzuSTDlfO
 RHzLCKzXoSnxMgo=; b=BOLf4GPJ51Am7YdxY5EZ7i5CeDbOfW6zmgJtLzQElOlO
 TRva+D7mXxh7S5pzwV2Dvw9Ue7nR7aHl1HzCD7+5dp1NrtaveNSgqRDmcWR97e4c
 4WwW+x4VQ51eQ5r71hunG3aTV69BHdkU5sFaRObG7MuFGpqbzdBcz452ea+BE1Nc
 msTclYKp+SSsCRi8gCEcYaGFH7Lx7TdYnfjKe2vcIRqlS+rDykEl0mqdnR5LwG2a
 KbP3omwJDjuF8oA3rP7rNXJ46a9onvd8NPiEsgEPukkEP8GS6wf+fz9WhCZ+Xzpn
 OUCqTH7jihHy04oH/h2PFA81LZD2hjG8hGxaKF5+OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=t72rFk
 rDJhyZI49nYs3HzuSTDlfORHzLCKzXoSnxMgo=; b=tHs3/I3HUXnU/zYoSFLDkY
 6E3ruMxLPEWB3RN6D/qAltnEWMY7v4V6nFze7hA3Ye2xYnoaJmrg0B/bJS9YX+MD
 0BiFh4uPJE/45zllcrb0X7lhm1EvJ9/Pmlzpcs9+w4WkdAY8Wm57m0Qj0SVFbIrG
 UF53C0Ffvbz5j360tRjShHlZTDa1KFy1opjHhYne1ePMD4hxu4sniX4O1cgnjPm1
 ooTfLvTpjCFFqE/jBR308UYvmRkUZH+lC+YWfKIfwc10TRd5qBgJbg67ZXpb/HNN
 jTIoFe0FkdVvtYPrl/TAtmcmcspRwphaqLoQPY/NOht6pgL7aGnnojNE8Qi88HvA
 ==
X-ME-Sender: <xms:ydTpXjRTbrm4cEm23TEEQbzvm_4VsQqnpxtQPvOBP9UXM03FanwGfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfgrhhi
 tgcunfhighhhthdfuceovghrihgtsegvrhhitghlihhghhhtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeevudeutdevleeiveehheejleeludegffdvkeeghfehkeehfeevhfdthfdu
 leehueenucffohhmrghinhepshgvnhhtvghntgdrvghsnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepvghrihgtsegvrhhitghlihhghhhtrdgt
 ohhm
X-ME-Proxy: <xmx:ytTpXkxBoCaiVZpzXNjIMxA5wOWtgdSCh7gwpR4t2zZSf5pd5S9-dA>
 <xmx:ytTpXo1tVn6UUKkWgndML7SpWwRg_mES1IBiszmjS4th1Zth2KMHlw>
 <xmx:ytTpXjC_GPrt4r8OZM9_qJgaH7wWRH3qYQ4I9ZMQ6pDMHgOB8YaTAw>
 <xmx:ytTpXvsJ4PTx80eVO4Fg2lFZsgpuV0KNdZrV2j9IlJmu-wLA281ZKQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E6535180091; Wed, 17 Jun 2020 04:31:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-529-g3ee424a-fm-20200611.001-g3ee424a1
Mime-Version: 1.0
Message-Id: <bbb39589-9b55-49fc-9723-8086909e0bcf@www.fastmail.com>
In-Reply-To: <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
 <CAHmME9oiN4uUjKPqAAkvrVtzh-0LgfLcPd92xQgFJAqgtWtXsw@mail.gmail.com>
Date: Wed, 17 Jun 2020 20:30:41 +1200
From: "Eric Light" <eric@ericlight.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] wg-quick: add restart command
Content-Type: text/plain
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

Oh hey that sounds like a great way to do it.  Seems like it'd be simpler than this patch set as well, which is always good.

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Wed, 17 Jun 2020, at 20:19, Jason A. Donenfeld wrote:
> On Wed, Jun 17, 2020 at 2:17 AM Eric Light <eric@ericlight.com> wrote:
> >
> > As a purely Debian user, the 'service x restart' pattern is far more memorable than the syncconf method.  I know personal preference isn't a great reason to add a knob, but Garrit's method is probably going to be much more familiar to many users.
> 
> For users who want service management patterns like that, it'd
> certainly be possible to map the wg-quick strip stuff to `systemctl
> reload wg-quick@wg0.service`, for that purpose. Maybe that's something
> we should consider?
>

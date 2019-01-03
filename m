Return-Path: <SRS0=V5/A=PL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AB3C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 02:49:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D683920833
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 02:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="PelSJZRR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wSMHWTEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D683920833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3443824e;
	Thu, 3 Jan 2019 02:46:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec679e7b
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 02:46:19 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b83e649e
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 02:46:19 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id DF5DB21C5F;
 Wed,  2 Jan 2019 21:48:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 02 Jan 2019 21:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:from:to:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=o
 O6/5YTvEqRb9AhVtNkvVMjPPeI/THCM0wpVkMG41kk=; b=PelSJZRRYoGZZTITf
 eN3pIO4MrN/k902LQ4j0Hb4SOQuJvalnmwl4VNwDiHfOuhEfxoRYY7/XkKq9bMgW
 BAA6hShHweVrgsR1YqNgvS/JfAb7KWEpEb1kTWzUojS8HfS0xzdLwtmZKmXNczeT
 Y46uEuJxxebNeJVw/NHB90UR5IN3eOtCCv4V4KUflk7tdvSQuXibOcGmz8VeW920
 RcJKwwILvidILwvUDwJtyOkszVCEl8EyvRrFrRiFoNEJAPFPV8yos242cUNiL3qE
 NZEoh5rgtVvaL7Kn66saqnyb+DkeT4iakR1o3S7h087/cR2+QgpHj1SH0QjG7puo
 MdEjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=oO6/5YTvEqRb9AhVtNkvVMjPPeI/THCM0wpVkMG41
 kk=; b=wSMHWTEfx9S+tH4iB9PGsaOWd+Xihg9bISCaAA/ebE5WJ0Er9uOi0/e2j
 zF5q5FtQr0EjAIYjImBb10gGZnXq4onneanpXeZIsB+fEqceHfsGj/Wb/U/c+910
 ZhjyGDD8J/j1o8IUn0RTBV2cGKvrKlKnwcmY6Dx3ul12+23nSJ8XDrkYiOdLCWl0
 iGPjERvsDGAUoT/Jvdsddta4XB5jhlTczBTcD35c1JuZ3IBwMqJwqAxualqkKTpl
 Cpco28M5b/gD9lTDXvb8Ij4yO9eohYheXYABWw3fIBTeSZVylFPGqqw7b924Ydol
 hCCE1pN++imgLnyttVMa3DeaVMmoQ==
X-ME-Sender: <xms:DXgtXDXe6gzL-_QiMP65_w7jikgIOsOpvG1HYI68w6wFbJECF_FxhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudejgdehgeculddtuddrgedtkedrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuhffvfhfkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucffohhmrghinhepghhmshdrihhtnecukfhppeejtd
 drudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghl
 sehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DXgtXIC7DzZNTbj9J4ZD93igiQ2nzQ3j1mulBDcrbnSJfftzeusnRw>
 <xmx:DXgtXGogBgzpS1Bs9h2lfdjIfQuWM8C7i5qFTOkraxD27oeyVcmD7Q>
 <xmx:DXgtXE0lyCrCLdJvlMMYpSJ3E2D8T4B2EFytv86PH9JrGDDwvASsCQ>
 <xmx:DXgtXLr-BJmfftuycT1YN1ZysJibpOCZtkgnkybmQZApXTAGKA6CkA>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27E9610085;
 Wed,  2 Jan 2019 21:48:45 -0500 (EST)
Subject: Re: [Android app] Can't connect to a chromecast when wireguard is
 running
From: Samuel Holland <samuel@sholland.org>
To: Christophe-Marie Duquesne <chmd@chmd.fr>,
 wireguard <wireguard@lists.zx2c4.com>
References: <CAHLp1YkibRSvohY9FJ5G+FXaEw4tFU52rLsbWLSP8oiL0K=rhQ@mail.gmail.com>
 <CAHLp1YmoZV-T+d_U_GDhSpgbK1099x+xVEUX=T24q5u=SKCnJA@mail.gmail.com>
 <084d8dd5-22d2-9635-514f-e2710190ddd6@sholland.org>
Message-ID: <4989cb64-56a9-3258-3e62-b7d821495ad2@sholland.org>
Date: Wed, 2 Jan 2019 20:48:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <084d8dd5-22d2-9635-514f-e2710190ddd6@sholland.org>
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 12/30/18 14:09, Samuel Holland wrote:
> Hi,
> 
> On 12/30/18 13:10, Christophe-Marie Duquesne wrote:
>> Thinking about my former setup with Openvpn, I realized it had a setting 
>> "bypass VPN for local networks" (under "routing"). Is there such a thing
>> in the Wireguard app? (In the peer config, there is a checkbox "Exclude 
>> private IPs". In doubt, I tried to enable it, but then the wireguard 
>> interface stopped working with the message "Error bringing up tunnel: Bad 
>> address")
>> 
>> Generally, the app which I believe would solve my chromecast problem is 
>> probably "Google play services" (com.google.android.gms). It is 
>> unfortunately not part of the list of applications one can exclude from the
>> UI. Is there a way to do one of these two things? - Implement a feature
>> similar to "bypass VPN for local networks"
> 
> That's the idea with the "Exclude private IPs" checkbox. Anything in the 
> RFC1918 range will not use the tunnel. Could you export a log (there's an 
> option in the app settings) with it failing, and send it to me (privately if 
> you want)?

The issue that was breaking the "Exclude private IPs" checkbox has been fixed
and will be part of the next release. Thanks for the report. (For the curious:
an IPv6 DNS server was getting added to the Allowed IPs list with an incorrect
netmask, and Android rejects VPN routes to subnets with a non-zero host part.)

Thanks,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

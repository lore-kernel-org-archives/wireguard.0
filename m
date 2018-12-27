Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A72DC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 18:59:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 677DE21741
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 18:59:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="T8v4xnU/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D8qM2KCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 677DE21741
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5558bdd;
	Thu, 27 Dec 2018 18:57:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd206bad
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 18:57:16 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a64653a
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 18:57:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3CAEA21FCF;
 Thu, 27 Dec 2018 13:58:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Dec 2018 13:58:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=t
 Ccx85HLv4zjK1s0sZ8oLRDER3sBRjvPwAgZCT9sRqg=; b=T8v4xnU/SchIiVV5p
 s6tGwFhg15GB4/FDdibfEs5I386KRjpKoMqZVSvJC7zAFnsK3VsPG3bkAcH4gzdW
 iET821QjciOyn1k6kKS9FSszScDinkW5E3XMuDV27Nshr8nfLl+ifytr0Kl/rJ41
 AcfWFlrxeuQTUY1h9VF0PcJP/E72UjrPHeGCoElA/k/mzpKAQiG8B4/MRJIaNTCz
 ZHyZwbfosRbqJSZatvOoeBibGR9EHdc3/yxb3BHg9uYILn65pdIHoqSWD/brnx+7
 fQg8F+z25QB61cUmXm/7Y3seP1UFgQBUUibfow5ELlFh5OUWZUf8PaALMSa5dOW+
 pYIZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=tCcx85HLv4zjK1s0sZ8oLRDER3sBRjvPwAgZCT9sR
 qg=; b=D8qM2KCjpU2rAQ4XTRp9EKjDeNGXNuPmu1fRKTaDMnRDm5MSDTh7hSd4q
 4iWwwiuVVIxgVaj7owGVBvhCCA9SV9jTvv0YE0KxRXTMb43BQdrn4qQCPUSGlF0s
 d8ILab0yuMSfH8i+SvfqrMk4QGwg++KmLvGZtjhPbWNkePGUsKW7Rc9IGF26SDJN
 oLkJzRqcsVpgJ4fmgJxl9EwHaBl6mma/ZdydxRwOAg8qF9vtEAEWnp/dFC+VVVJI
 BrG11UIjvdoohU1gQ7YajIUTcD6AsYVebC2ZVHyh/AwKLLPVqlCTwTVspX4khk8k
 Y/U3wQcJ4F2rZbdUmCACQdkgYG/vg==
X-ME-Sender: <xms:7SAlXBs1hgN3D6TaGM7QtbZNDoZmU_oC5HMd1zX3TUPfSA1lgrvwcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrtdefgdehkeculddtuddrgedtkedrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucfkphepleelrdduleekrdduleelrddugeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:7SAlXDRO0slSFRKbVx5ZEJXy6Gm2QDkyeYGTBOI_WTJ9UAf5bUoxfg>
 <xmx:7SAlXLu-khLybu63TiFJKDo6hgKr_Xrd5umHxk77B-IME4tL40yyLg>
 <xmx:7SAlXBxtroi1DoU7sClPTl5oqOXERX_H3El2wzdGf68rej8JuxcbrA>
 <xmx:7iAlXBdbCky2VpWy9SaGo9yWDQc_wRMllDjtm_Bm1o1e4NcY-dwAlQ>
Received: from [192.168.17.162] (unknown [99.198.199.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21E1E10085;
 Thu, 27 Dec 2018 13:58:53 -0500 (EST)
Subject: Re: wg-quick: Read private key from file?
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>,
 wireguard@lists.zx2c4.com
References: <c522bb63-f64a-6622-0966-7a4c3b936cf9@bartschnet.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e515967c-f879-656c-f4d6-58c4a4a8cf1e@sholland.org>
Date: Thu, 27 Dec 2018 12:58:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c522bb63-f64a-6622-0966-7a4c3b936cf9@bartschnet.de>
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

On 12/27/18 10:51, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> does wg-quick allow to read the private key from a file instead of a .conf-file?

Yes, and the manual page wg-quick(8) even has an example of how to read the
private key from an external source:

    Or, perhaps it is desirable to store private keys in encrypted form, such
    as through use of pass(1):

        PostUp = wg set %i private-key <(pass WireGuard/private-keys/%i)

If you want to use a file, just provide the filename, as in:

    PostUp = wg set %i private-key /etc/wireguard/wg0.key

From the wg(8) manual page:

    Both private-key and preshared-key must be a files, because command line
    arguments are not considered private on most systems; but if you are using
    bash(1), you may safely pass in a string by specifying as private-key or
    preshared-key the expression:  <(echo PRIVATEKEYSTRING).

There's no need to write additional wrapper scripts or anything like that.

If you weren't aware of those two manual pages, I suggest reading through both.
It will answer most of your questions :)

Hope that helps,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

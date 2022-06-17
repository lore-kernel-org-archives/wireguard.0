Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B479C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:55:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 48cac462;
	Fri, 17 Jun 2022 11:53:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b9865751
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 11:53:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C6D7AB829D0;
 Fri, 17 Jun 2022 11:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 253D3C3411D;
 Fri, 17 Jun 2022 11:53:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=zx2c4.com header.i=@zx2c4.com header.b="ity2LnKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655466791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9Fd083+XQdBxuIlcmDRnfk77NhmAN/pWGqoLE23cNy8=;
 b=ity2LnKrsPvtlbl+Ssh4CdyHFUZjH2uq6uThNDaoUDEluLsdsDH4zVMEsOMu5XcNgfjlcL
 oFnrW09XYmaQn7ochNfACDz7UjzAUyPu7+0Y2ZS2fWPt/N/cRj42RC2w9O2Cn3k+IcYKpj
 4wNEzXcMsiaNkpWTlBF1XyqsAv/XYeY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a09e78e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 17 Jun 2022 11:53:11 +0000 (UTC)
Date: Fri, 17 Jun 2022 13:53:09 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Tom Yan <tom.ty89@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: avoid traffics from momentarily leaking into
 the tunnel
Message-ID: <YqxrJRfTG+7WL16u@zx2c4.com>
References: <20220617113419.17329-1-tom.ty89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220617113419.17329-1-tom.ty89@gmail.com>
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

On Fri, Jun 17, 2022 at 07:34:19PM +0800, Tom Yan wrote:
> The wireguard route table ip rule should stay as a NOP until the
> `suppress_prefixlength 0 table main` rule is in effect. Therefore,
> add the wireguard default route to its route table after the latter
> rule is added.
> 
> Signed-off-by: Tom Yan <tom.ty89@gmail.com>

Applied, thanks.

> ---
>  src/wg-quick/linux.bash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
> index e4d4c4f..69e5bef 100755
> --- a/src/wg-quick/linux.bash
> +++ b/src/wg-quick/linux.bash
> @@ -220,9 +220,9 @@ add_default() {
>  	fi
>  	local proto=-4 iptables=iptables pf=ip
>  	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
> -	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
>  	cmd ip $proto rule add not fwmark $table table $table
>  	cmd ip $proto rule add table main suppress_prefixlength 0
> +	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
>  
>  	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
>  	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
> -- 
> 2.36.1
> 

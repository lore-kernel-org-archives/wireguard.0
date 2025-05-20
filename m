Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7C5C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a817f76;
	Tue, 20 May 2025 22:18:35 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 395f038a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 22:18:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7B34FA4EDD7;
 Tue, 20 May 2025 22:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C08E7C4CEE9;
 Tue, 20 May 2025 22:18:29 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZqBWeON+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747779508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6LwGJz19emXqJ5ZmVMt8zpUGgQeVJqea4EE0QhIvm44=;
 b=ZqBWeON+nwlnJ8LaCGRXefZMM6LMsLS7pymhj99S8liM0Zl9jo8FrlDSvYYpMl0ZC526Ux
 lVDGLj072l6GfwLFWvORk9D9tTjTDUyX+0rhfqNo7LjYxPeTw4K4Pt3RuBofWHrH+u9qcA
 D6X3ZawA8M+/4OZkJ8NgYeU/Xp1Yntg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abf96449
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 May 2025 22:18:28 +0000 (UTC)
Date: Wed, 21 May 2025 00:18:26 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: TriangleSnake <trianglesnake2002@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: add 'dev' to 'ip link add' to avoid keyword
 conflicts
Message-ID: <aCz_sv1FDc_1horM@zx2c4.com>
References: <20250505071306.80342-1-trianglesnake2002@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250505071306.80342-1-trianglesnake2002@gmail.com>
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

On Mon, May 05, 2025 at 03:13:06PM +0800, TriangleSnake wrote:
> Signed-off-by: TriangleSnake <trianglesnake2002@gmail.com>
> ---
>  src/wg-quick/linux.bash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
> index 4193ce5..93df80d 100755
> --- a/src/wg-quick/linux.bash
> +++ b/src/wg-quick/linux.bash
> @@ -87,7 +87,7 @@ auto_su() {
>  
>  add_if() {
>  	local ret
> -	if ! cmd ip link add "$INTERFACE" type wireguard; then
> +	if ! cmd ip link add dev "$INTERFACE" type wireguard; then
>  		ret=$?
>  		[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
>  		echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation." >&2

Applied, thanks.

Jason

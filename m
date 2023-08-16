Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2CDC27C6D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Aug 2023 22:31:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4128ea87;
	Wed, 16 Aug 2023 22:29:05 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 510e2069
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Aug 2023 22:29:03 +0000 (UTC)
Received: from nvm (nvm2.home.romanrm.net [IPv6:fd39::4a:3cff:fe57:d6b5])
 by len.romanrm.net (Postfix) with SMTP id 9EEDD4010B;
 Wed, 16 Aug 2023 22:29:02 +0000 (UTC)
Date: Thu, 17 Aug 2023 03:29:02 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Henrik Hautakoski <henrik@eossweden.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: linux: add restart command.
Message-ID: <20230817032902.0d2f7a29@nvm>
In-Reply-To: <20230816050653.28972-1-henrik@eossweden.org>
References: <20230816050653.28972-1-henrik@eossweden.org>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 16 Aug 2023 07:06:53 +0200
Henrik Hautakoski <henrik@eossweden.org> wrote:

> Add a simple "restart" command that just do cmd_down followed by an cmd_up. Saves abit of typing :)
> 
> Signed-off-by: Henrik Hautakoski <henrik@eossweden.org>
> ---
>  src/wg-quick/linux.bash | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
> index 69e5bef..cc9f288 100755
> --- a/src/wg-quick/linux.bash
> +++ b/src/wg-quick/linux.bash
> @@ -298,7 +298,7 @@ execute_hooks() {
>  
>  cmd_usage() {
>  	cat >&2 <<-_EOF
> -	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
> +	Usage: $PROGRAM [ up | down | restart | save | strip ] [ CONFIG_FILE | INTERFACE ]
>  
>  	  CONFIG_FILE is a configuration file, whose filename is the interface name
>  	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
> @@ -373,6 +373,11 @@ elif [[ $# -eq 2 && $1 == down ]]; then
>  	auto_su
>  	parse_options "$2"
>  	cmd_down
> +elif [[ $# -eq 2 && $1 == restart ]]; then
> +	auto_su
> +	parse_options "$2"
> +	cmd_down
> +    cmd_up

cmd_down and the lines prior use a TAB to indent, but cmd_up uses 4 spaces
instead.

-- 
With respect,
Roman

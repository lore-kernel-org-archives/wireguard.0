Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56075C352B6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC2C2072D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gugod.fr header.i=@gugod.fr header.b="jfoFoK+L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDC2C2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gugod.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f97a0333;
	Tue, 14 Apr 2020 08:03:44 +0000 (UTC)
Received: from mail.localhosting.tech (mail.localhosting.tech [66.70.129.155])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d4f7876
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2020 09:33:27 +0000 (UTC)
Received: from mail.localhosting.tech (localhost [127.0.0.1])
 by mail.localhosting.tech (OpenSMTPD) with ESMTP id f2a3ebc7
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2020 11:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=gugod.fr; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=SMBSw8yhk
 iAeV31mSVylZ6LXWvU=; b=jfoFoK+LuLkt1qgOQTStAILMpO5QSlIds/sOpowLr
 bm1NZFZ2i8fVHaye3dSFnyP99sOygdtprRcCG7z7nGUt/wxFdnZZWnCX18a9zktT
 7WdXDdj9iytjf7rOEHK+wg5/5+brMrGwyFt/I0xrLxL1hwCTgP14kZ2s9SSR/e09
 s2dDJj0aCw7aHgd3H4h1mUQEldpWI9rmq35QptTZ8QcAVEcT+nihlgArzmSG+UgV
 Tp2NOphq0VtPJncvsVo5pzqjQtN/kFcab0aPJ0S9bXJ2QQybfiObDfkVE4wp47BE
 NZU7EzVytTO8N5pU4+60n7WOZsq9NNVnq2Hl8VZto6jrQ==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gugod.fr; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=1gh
 LAAI+aXD31FL4+c48sG7udAI4JZgVrYRL1gxZpU7B59t1hZAs75Q66wqsRmPKQrL
 cxzzjzQHLUWv+coz2xYMxuwsUFlfdBtqeS/2hgEIfxTpuwVxHfQmf9eCgNNrqo8T
 2QCj+nJmElpUe3NpSpe+CAAuiAQiOCsVkofC99bNMMJLoF3hIlHbqOQ+xROUKPOK
 UxicpRrXcpov4EiXnxZ05Z0A1a9nNuVYpX2+xZwovh6n+xNXCq4P+hxyHY+lL91c
 Td6fOrUEK8g8P3BlStrnbUEwxqEuaA5yrVmVxaC6c3ZDvzAt3OIV6Nn2q2/YnPwA
 5srPVwY7lc5LqFdu0Jw==
Received: from [192.168.1.155] (<unknown> [193.33.56.42])
 by mail.localhosting.tech (OpenSMTPD) with ESMTPSA id a8cc64eb
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2020 11:42:42 +0200 (CEST)
Subject: Re: [PATCH] wg-quick: add 'reload' command (wrapper for 'wg syncconf')
To: wireguard@lists.zx2c4.com
References: <20200330084157.51834-1-tore@fud.no>
From: Guy Godfroy <guy.godfroy@gugod.fr>
Message-ID: <c9dab5f9-e34b-bf53-c018-b2985c7bdf9a@gugod.fr>
Date: Fri, 10 Apr 2020 11:42:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330084157.51834-1-tore@fud.no>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:03:41 +0200
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

I wish this patch could be merged. This would make stuff easier, cleaner 
and consistent with a lot of other services.

Guy Godfroy

Le 30/03/2020 à 10:41, Tore Anderson a écrit :
> Also add an ExecReload statement that uses this in the systemd template unit.
> 
> Signed-off-by: Tore Anderson <tore@fud.no>
> ---
>   src/man/wg-quick.8            |  9 ++++++---
>   src/systemd/wg-quick@.service |  1 +
>   src/wg-quick/darwin.bash      | 17 ++++++++++++++++-
>   src/wg-quick/freebsd.bash     | 15 ++++++++++++++-
>   src/wg-quick/linux.bash       | 15 ++++++++++++++-
>   src/wg-quick/openbsd.bash     | 15 ++++++++++++++-
>   6 files changed, 65 insertions(+), 7 deletions(-)
> 
> diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8reload
> index eca3b48..023805e 100644
> --- a/src/man/wg-quick.8
> +++ b/src/man/wg-quick.8
> @@ -10,6 +10,8 @@ wg-quick - set up a WireGuard interface simply
>   |
>   .I down
>   |
> +.I reload
> +|
>   .I save
>   |
>   .I strip
> @@ -28,9 +30,10 @@ Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and
>   an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
>   supplied IP addresses, sets up mtu and routes, and optionally runs pre/post up scripts. Running \fIdown\fP
>   optionally saves the current configuration, removes the WireGuard interface, and optionally
> -runs pre/post down scripts. Running \fIsave\fP saves the configuration of an existing
> -interface without bringing the interface down. Use \fIstrip\fP to output a configuration file
> -with all
> +runs pre/post down scripts. Running \fIreload\fP synchronises any changes to peers/keys in
> +the config file with an already active interfaces. Running \fIsave\fP saves the configuration
> +of an existing interface without bringing the interface down. Use \fIstrip\fP to output a
> +configuration file with all
>   .BR wg-quick (8)-specific
>   options removed, suitable for use with
>   .BR wg (8).
> diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> index 7c5f9d1..a3b89d9 100644
> --- a/src/systemd/wg-quick@.service
> +++ b/src/systemd/wg-quick@.service
> @@ -14,6 +14,7 @@ Type=oneshot
>   RemainAfterExit=yes
>   ExecStart=/usr/bin/wg-quick up %i
>   ExecStop=/usr/bin/wg-quick down %i
> +ExecReload=/usr/bin/wg-quick reload %i
>   Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
>   
>   [Install]
> diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
> index d9d07cf..a732d6a 100755
> --- a/src/wg-quick/darwin.bash
> +++ b/src/wg-quick/darwin.bash
> @@ -350,6 +350,10 @@ set_config() {
>   	cmd wg setconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
>   }
>   
> +sync_config() {
> +	cmd wg syncconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
> +}
> +
>   save_config() {
>   	local old_umask new_config current_config address cmd
>   	new_config=$'[Interface]\n'
> @@ -398,7 +402,7 @@ execute_hooks() {
>   
>   cmd_usage() {
>   	cat >&2 <<-_EOF
> -	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
> +	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
>   
>   	  CONFIG_FILE is a configuration file, whose filename is the interface name
>   	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
> @@ -458,6 +462,13 @@ cmd_down() {
>   	execute_hooks "${POST_DOWN[@]}"
>   }
>   
> +cmd_reload() {
> +	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
> +		die "\`$INTERFACE' is not a WireGuard interface"
> +	fi
> +	sync_config
> +}
> +
>   cmd_save() {
>   	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
>   		die "\`$INTERFACE' is not a WireGuard interface"
> @@ -482,6 +493,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
>   	auto_su
>   	parse_options "$2"
>   	cmd_down
> +elif [[ $# -eq 2 && $1 == reload ]]; then
> +	auto_su
> +	parse_options "$2"
> +	cmd_reload
>   elif [[ $# -eq 2 && $1 == save ]]; then
>   	auto_su
>   	parse_options "$2"
> diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
> index c390dcc..6eef1f6 100755
> --- a/src/wg-quick/freebsd.bash
> +++ b/src/wg-quick/freebsd.bash
> @@ -333,6 +333,10 @@ set_config() {
>   	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
>   }
>   
> +sync_config() {
> +	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
> +}
> +
>   save_config() {
>   	local old_umask new_config current_config address cmd
>   	new_config=$'[Interface]\n'
> @@ -382,7 +386,7 @@ execute_hooks() {
>   
>   cmd_usage() {
>   	cat >&2 <<-_EOF
> -	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
> +	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
>   
>   	  CONFIG_FILE is a configuration file, whose filename is the interface name
>   	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
> @@ -440,6 +444,11 @@ cmd_down() {
>   	execute_hooks "${POST_DOWN[@]}"
>   }
>   
> +cmd_reload() {
> +	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
> +	sync_config
> +}
> +
>   cmd_save() {
>   	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
>   	save_config
> @@ -464,6 +473,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
>   	auto_su
>   	parse_options "$2"
>   	cmd_down
> +elif [[ $# -eq 2 && $1 == reload ]]; then
> +	auto_su
> +	parse_options "$2"
> +	cmd_reload
>   elif [[ $# -eq 2 && $1 == save ]]; then
>   	auto_su
>   	parse_options "$2"
> diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
> index 7c2c002..37d6ba8 100755
> --- a/src/wg-quick/linux.bash
> +++ b/src/wg-quick/linux.bash
> @@ -246,6 +246,10 @@ set_config() {
>   	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
>   }
>   
> +sync_config() {
> +	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
> +}
> +
>   save_config() {
>   	local old_umask new_config current_config address cmd
>   	[[ $(ip -all -brief address show dev "$INTERFACE") =~ ^$INTERFACE\ +\ [A-Z]+\ +(.+)$ ]] || true
> @@ -293,7 +297,7 @@ execute_hooks() {
>   
>   cmd_usage() {
>   	cat >&2 <<-_EOF
> -	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
> +	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
>   
>   	  CONFIG_FILE is a configuration file, whose filename is the interface name
>   	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
> @@ -347,6 +351,11 @@ cmd_down() {
>   	execute_hooks "${POST_DOWN[@]}"
>   }
>   
> +cmd_reload() {
> +	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
> +	sync_config
> +}
> +
>   cmd_save() {
>   	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
>   	save_config
> @@ -368,6 +377,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
>   	auto_su
>   	parse_options "$2"
>   	cmd_down
> +elif [[ $# -eq 2 && $1 == reload ]]; then
> +	auto_su
> +	parse_options "$2"
> +	cmd_reload
>   elif [[ $# -eq 2 && $1 == save ]]; then
>   	auto_su
>   	parse_options "$2"
> diff --git a/src/wg-quick/openbsd.bash b/src/wg-quick/openbsd.bash
> index 8d458d1..c509e70 100755
> --- a/src/wg-quick/openbsd.bash
> +++ b/src/wg-quick/openbsd.bash
> @@ -313,6 +313,10 @@ set_config() {
>   	cmd wg setconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
>   }
>   
> +sync_config() {
> +	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
> +}
> +
>   save_config() {
>   	local old_umask new_config current_config address network cmd
>   	new_config=$'[Interface]\n'
> @@ -361,7 +365,7 @@ execute_hooks() {
>   
>   cmd_usage() {
>   	cat >&2 <<-_EOF
> -	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
> +	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
>   
>   	  CONFIG_FILE is a configuration file, whose filename is the interface name
>   	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
> @@ -419,6 +423,11 @@ cmd_down() {
>   	execute_hooks "${POST_DOWN[@]}"
>   }
>   
> +cmd_reload() {
> +	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
> +	sync_config
> +}
> +
>   cmd_save() {
>   	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
>   		die "\`$INTERFACE' is not a WireGuard interface"
> @@ -442,6 +451,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
>   	auto_su
>   	parse_options "$2"
>   	cmd_down
> +elif [[ $# -eq 2 && $1 == reload ]]; then
> +	auto_su
> +	parse_options "$2"
> +	cmd_reload
>   elif [[ $# -eq 2 && $1 == save ]]; then
>   	auto_su
>   	parse_options "$2"
> 

Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33c79d4b
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:48:18 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2848bf9c
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:48:18 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Manuel =?utf-8?Q?Sch=C3=B6lling?= <manuel.schoelling@gmx.de>,
 wireguard@lists.zx2c4.com
Subject: Re: [PATCH] tools: Use '-' to read from stdin instead of file
In-Reply-To: <20171210134805.3441-1-manuel.schoelling@gmx.de>
References: <20171210134805.3441-1-manuel.schoelling@gmx.de>
Date: Mon, 11 Dec 2017 14:49:30 -0500
Message-ID: <871sk1xcxh.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun 2017-12-10 14:48:05 +0100, Manuel Schölling wrote:
> ---
>  src/tools/config.c  | 15 ++++++++++-----
>  src/tools/setconf.c | 17 +++++++++++------
>  src/tools/wg.8      |  6 ++++--
>  3 files changed, 25 insertions(+), 13 deletions(-)
>
> diff --git a/src/tools/config.c b/src/tools/config.c
> index 1fddb64..d7bd926 100644
> --- a/src/tools/config.c
> +++ b/src/tools/config.c
> @@ -121,10 +121,14 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)
>  	char dst[WG_KEY_LEN_BASE64];
>  	bool ret = false;
>  
> -	f = fopen(path, "r");
> -	if (!f) {
> -		perror("fopen");
> -		return false;
> +	if (strcmp(path, "-") == 0)
> +		f = stdin;
> +	else {
> +		f = fopen(path, "r");
> +		if (!f) {
> +			perror("fopen");
> +			return false;
> +		}
>  	}
>  
>  	if (fread(dst, WG_KEY_LEN_BASE64 - 1, 1, f) != 1) {
> @@ -157,7 +161,8 @@ static bool parse_keyfile(uint8_t key[static WG_KEY_LEN], const char *path)
>  	ret = parse_key(key, dst);
>  
>  out:
> -	fclose(f);
> +	if (f != stdin)
> +		fclose(f);
>  	return ret;
>  }
>  
> diff --git a/src/tools/setconf.c b/src/tools/setconf.c
> index b87a13f..137d2bd 100644
> --- a/src/tools/setconf.c
> +++ b/src/tools/setconf.c
> @@ -27,13 +27,18 @@ int setconf_main(int argc, char *argv[])
>  		return 1;
>  	}
>  
> -	config_input = fopen(argv[2], "r");
> -	if (!config_input) {
> -		perror("fopen");
> -		return 1;
> +	if (strcmp(argv[2], "-") == 0)
> +		config_input = stdin;
> +	else {
> +		config_input = fopen(argv[2], "r");
> +		if (!config_input) {
> +			perror("fopen");
> +			return 1;
> +		}
>  	}
>  	if (!config_read_init(&ctx, !strcmp(argv[0], "addconf"))) {
> -		fclose(config_input);
> +		if (config_input != stdin)
> +			fclose(config_input);
>  		return 1;
>  	}
>  	while (getline(&config_buffer, &config_buffer_len, config_input) >= 0) {
> @@ -58,7 +63,7 @@ int setconf_main(int argc, char *argv[])
>  	ret = 0;
>  
>  cleanup:
> -	if (config_input)
> +	if (config_input && config_input != stdin)
>  		fclose(config_input);
>  	free(config_buffer);
>  	free_wgdevice(device);
> diff --git a/src/tools/wg.8 b/src/tools/wg.8
> index 612fb4e..9e03882 100644
> --- a/src/tools/wg.8
> +++ b/src/tools/wg.8
> @@ -65,8 +65,9 @@ be a files, because command line arguments are not considered private on
>  most systems but if you are using
>  .BR bash (1),
>  you may safely pass in a string by specifying as \fIprivate-key\fP or
> -\fIpreshared-key\fP the expression: <(echo PRIVATEKEYSTRING). If
> -\fI/dev/null\fP or another empty file is specified as the filename for
> +\fIpreshared-key\fP the expression: <(echo PRIVATEKEYSTRING). You can also
> +pass '-' as filename to read the key from stdin.
> +If \fI/dev/null\fP or another empty file is specified as the filename for
>  either \fIprivate-key\fP or \fIpreshared-key\fP, the key is removed from
>  the device. The use of \fIpreshared-key\fP is optional, and may be omitted;
>  it adds an additional layer of symmetric-key cryptography to be mixed into
> @@ -88,6 +89,7 @@ and may be specified in hexadecimal by prepending "0x".
>  Sets the current configuration of \fI<interface>\fP to the contents of
>  \fI<configuration-filename>\fP, which must be in the format described
>  by \fICONFIGURATION FILE FORMAT\fP below.
> +If you pass '-' as filename, the configuration will be read from stdin.
>  .TP
>  \fBaddconf\fP \fI<interface>\fP \fI<configuration-filename>\fP
>  Appends the contents of \fI<configuration-filename>\fP, which must

This is a common unix convention, and it seems both user-friendly and
harmless to support it.

I'm not sure why it's important to avoid closing stdin when you don't
plan on reading from it any more, though.  Isn't it more parsimonious to
go ahead and explicitly close it so that anything writing additional
data to stdin will get an error?

     --dkg

Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0615C3DA6E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3921a8fc;
	Wed, 20 Dec 2023 05:00:26 +0000 (UTC)
Received: from out-200.mta1.migadu.com (out-200.mta1.migadu.com
 [2001:41d0:203:375::c8])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7b0c656
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Oct 2023 23:42:16 +0000 (UTC)
X-Gm-Message-State: AOJu0YxOy1EJGm2yTog3PhswZH19RZpuQNIyWqY3Z3OLgQz5Q2ucYi/2
 /Plpq5cAnz22ycncj9ZDBy0OJikHIR5Th2hGIPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ewpratten.com;
 s=key1; t=1698104536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+DFe1Iun5pRM8m+pqkuPU1vNaFDbg7/7twS/Zuk728k=;
 b=c8+EShDvqgxUARq4OorKliW9x0CPEHIBN9hOmHlKnsmtIsqoBPUwHvH0LOZ5W8nzGfPY1L
 lVSS9780pXhSyiFF5/AmdEThAZo/vzZkkxEeZtsET7NpFrBhSBSrOwTKAc9nRHSwClY6nz
 kYh73mj6zko9D5bT3fP/RLjJvle+EQ7OCL/L7QGDJT1Un/JmMKB7K1gEU3E8ZJ1iUnCfs1
 jH/sNpIkaVod7348v/AoG2GBmf09vgYlWaN3ft7NBB5XYSAiUzAmMsoyHl4VA3itvRNtHF
 RIghyQZroAmiStL+xYh0YgGPnlAPPvnOWe1yfGpF2HQ4AOqlkBt1tf5glIq0TA==
X-Google-Smtp-Source: AGHT+IEajdk4pbeYeT4dkNlIUkJ3J1WA+shTyDC+O66MstiCTrFiFLVR1Xel3TnCVg7g2BX2wt+iX5p1Dl0yXv4iubo=
X-Received: by 2002:a2e:86d5:0:b0:2c5:94a:ac96 with SMTP id
 n21-20020a2e86d5000000b002c5094aac96mr7758841ljj.9.1698104534656; Mon, 23 Oct
 2023 16:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20231023171723.137097-1-dxld@darkboxed.org>
In-Reply-To: <20231023171723.137097-1-dxld@darkboxed.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Evan Pratten <evan@ewpratten.com>
Date: Mon, 23 Oct 2023 19:42:03 -0400
X-Gmail-Original-Message-ID: <CAD=s3w5U-p7raqHG-LpkQgFDT7-pb9jExTmogYX6GdP7wxXGMA@mail.gmail.com>
Message-ID: <CAD=s3w5U-p7raqHG-LpkQgFDT7-pb9jExTmogYX6GdP7wxXGMA@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND^2] wg: Support restricting address family of DNS
 resolved Endpoint
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: wireguard@lists.zx2c4.com, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Wed, 20 Dec 2023 05:00:21 +0000
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

I'd also like to +1 this patch.

While its manageable to keep a dedicated v4.vpn.example.com and
v6.vpn.example.com for single-stack hosts, it would be much cleaner to
properly handle this case.

Plus, this seems to trip up lots of people who are deploying
WireGuard+BGP setups to bring IPv6 to their homes (of which, the list
keeps growing). Of everyone I've helped deploy such a setup, much more
than half end up accidentally blackhole-ing their devices due to an
accidental AAAA record.

 - Evan

On Mon, Oct 23, 2023 at 1:37=E2=80=AFPM Daniel Gr=C3=B6ber <dxld@darkboxed.=
org> wrote:
>
> When using wireguard tunnels for providing IPv6 connectivity to machines =
it
> can be important to pin which IP address family should be used.
>
> Consider a peer using a DNS name with both A/AAAA records, wg will
> currently blindly follow system policy and use the first address returned
> by getaddrinfo(). In typical deployments this will cause the IPv6 address
> of the peer to be used, however when the whole IPv6 internet is being
> routed over our wg iface all this accomplishes is a traffic black hole.
>
> Naturally this can be worked around by having different DNS names for
> v4-only / dual-stack addresses, however this may not be possible in some
> situations where, say, a dynamic-DNS service is also in use.
>
> To fix this we allow users to control which address family they want usin=
g
> the new AddressFamily=3D config option, see wg.8 for details. We also upd=
ate
> reresolve-dns to take the AddressFamily option into account.
>
> We would like to note that the not_oif patch[1] would also alleviate this
> problem but since this never got merged it's not a workable solution.
>
> [1]: http://marc.info/?t=3D145452167200014&r=3D1&w=3D2
>
> Signed-off-by: Daniel Gr=C3=B6ber <dxld@darkboxed.org>
> ---
>  contrib/reresolve-dns/reresolve-dns.sh |  4 ++-
>  src/config.c                           | 41 ++++++++++++++++++++------
>  src/config.h                           |  2 +-
>  src/containers.h                       |  5 ++++
>  src/man/wg.8                           |  8 ++++-
>  src/set.c                              |  9 +++++-
>  src/setconf.c                          |  2 +-
>  7 files changed, 57 insertions(+), 14 deletions(-)
>
> diff --git a/contrib/reresolve-dns/reresolve-dns.sh b/contrib/reresolve-d=
ns/reresolve-dns.sh
> index 711c332..bdb47ac 100755
> --- a/contrib/reresolve-dns/reresolve-dns.sh
> +++ b/contrib/reresolve-dns/reresolve-dns.sh
> @@ -17,7 +17,7 @@ process_peer() {
>         [[ $PEER_SECTION -ne 1 || -z $PUBLIC_KEY || -z $ENDPOINT ]] && re=
turn 0
>         [[ $(wg show "$INTERFACE" latest-handshakes) =3D~ ${PUBLIC_KEY//+=
/\\+}\   ([0-9]+) ]] || return 0
>         (( ($EPOCHSECONDS - ${BASH_REMATCH[1]}) > 135 )) || return 0
> -       wg set "$INTERFACE" peer "$PUBLIC_KEY" endpoint "$ENDPOINT"
> +       wg set "$INTERFACE" peer "$PUBLIC_KEY" endpoint "$ENDPOINT" addre=
ss-family "$FAMILY"
>         reset_peer_section
>  }
>
> @@ -25,6 +25,7 @@ reset_peer_section() {
>         PEER_SECTION=3D0
>         PUBLIC_KEY=3D""
>         ENDPOINT=3D""
> +       FAMILY=3Dunspec
>  }
>
>  reset_peer_section
> @@ -38,6 +39,7 @@ while read -r line || [[ -n $line ]]; do
>                 case "$key" in
>                 PublicKey) PUBLIC_KEY=3D"$value"; continue ;;
>                 Endpoint) ENDPOINT=3D"$value"; continue ;;
> +               AddressFamily) FAMILY=3D"$value"; continue ;;
>                 esac
>         fi
>  done < "$CONFIG_FILE"
> diff --git a/src/config.c b/src/config.c
> index 1e924c7..f9980fe 100644
> --- a/src/config.c
> +++ b/src/config.c
> @@ -192,14 +192,14 @@ static inline int parse_dns_retries(void)
>         return (int)ret;
>  }
>
> -static inline bool parse_endpoint(struct sockaddr *endpoint, const char =
*value)
> +static inline bool parse_endpoint(struct sockaddr *endpoint, const char =
*value, int family)
>  {
>         char *mutable =3D strdup(value);
>         char *begin, *end;
>         int ret, retries =3D parse_dns_retries();
>         struct addrinfo *resolved;
>         struct addrinfo hints =3D {
> -               .ai_family =3D AF_UNSPEC,
> +               .ai_family =3D family,
>                 .ai_socktype =3D SOCK_DGRAM,
>                 .ai_protocol =3D IPPROTO_UDP
>         };
> @@ -279,6 +279,20 @@ static inline bool parse_endpoint(struct sockaddr *e=
ndpoint, const char *value)
>         return true;
>  }
>
> +static inline bool parse_address_family(int *family, const char *value)
> +{
> +       if (strcmp(value, "inet") =3D=3D 0)
> +               *family =3D AF_INET;
> +       else if (strcmp(value, "inet6") =3D=3D 0)
> +               *family =3D AF_INET6;
> +       else if (strcmp(value, "unspec") =3D=3D 0)
> +               *family =3D AF_UNSPEC;
> +       else
> +               return false;
> +
> +       return true;
> +}
> +
>  static inline bool parse_persistent_keepalive(uint16_t *interval, uint32=
_t *flags, const char *value)
>  {
>         unsigned long ret;
> @@ -458,8 +472,10 @@ static bool process_line(struct config_ctx *ctx, con=
st char *line)
>                         goto error;
>         } else if (ctx->is_peer_section) {
>                 if (key_match("Endpoint"))
> -                       ret =3D parse_endpoint(&ctx->last_peer->endpoint.=
addr, value);
> -               else if (key_match("PublicKey")) {
> +                       ctx->last_peer->endpoint_value =3D strdup(value);
> +               else if (key_match("AddressFamily")) {
> +                       ret =3D parse_address_family(&ctx->last_peer->add=
r_fam, value);
> +               } else if (key_match("PublicKey")) {
>                         ret =3D parse_key(ctx->last_peer->public_key, val=
ue);
>                         if (ret)
>                                 ctx->last_peer->flags |=3D WGPEER_HAS_PUB=
LIC_KEY;
> @@ -535,19 +551,22 @@ bool config_read_init(struct config_ctx *ctx, bool =
append)
>         return true;
>  }
>
> -struct wgdevice *config_read_finish(struct config_ctx *ctx)
> +struct wgdevice *config_read_finish(struct wgdevice *device)
>  {
>         struct wgpeer *peer;
>
> -       for_each_wgpeer(ctx->device, peer) {
> +       for_each_wgpeer(device, peer) {
>                 if (!(peer->flags & WGPEER_HAS_PUBLIC_KEY)) {
>                         fprintf(stderr, "A peer is missing a public key\n=
");
>                         goto err;
>                 }
> +
> +               if (!parse_endpoint(&peer->endpoint.addr, peer->endpoint_=
value, peer->addr_fam))
> +                       goto err;
>         }
> -       return ctx->device;
> +       return device;
>  err:
> -       free_wgdevice(ctx->device);
> +       free_wgdevice(device);
>         return NULL;
>  }
>
> @@ -619,7 +638,11 @@ struct wgdevice *config_read_cmd(const char *argv[],=
 int argc)
>                         argv +=3D 1;
>                         argc -=3D 1;
>                 } else if (!strcmp(argv[0], "endpoint") && argc >=3D 2 &&=
 peer) {
> -                       if (!parse_endpoint(&peer->endpoint.addr, argv[1]=
))
> +                       peer->endpoint_value =3D strdup(argv[1]);
> +                       argv +=3D 2;
> +                       argc -=3D 2;
> +               } else if (!strcmp(argv[0], "address-family") && argc >=
=3D 2 && peer) {
> +                       if (!parse_address_family(&peer->addr_fam, argv[1=
]))
>                                 goto error;
>                         argv +=3D 2;
>                         argc -=3D 2;
> diff --git a/src/config.h b/src/config.h
> index 443cf21..6f81da2 100644
> --- a/src/config.h
> +++ b/src/config.h
> @@ -22,6 +22,6 @@ struct config_ctx {
>  struct wgdevice *config_read_cmd(const char *argv[], int argc);
>  bool config_read_init(struct config_ctx *ctx, bool append);
>  bool config_read_line(struct config_ctx *ctx, const char *line);
> -struct wgdevice *config_read_finish(struct config_ctx *ctx);
> +struct wgdevice *config_read_finish(struct wgdevice *device);
>
>  #endif
> diff --git a/src/containers.h b/src/containers.h
> index a82e8dd..c111621 100644
> --- a/src/containers.h
> +++ b/src/containers.h
> @@ -52,12 +52,15 @@ struct wgpeer {
>         uint8_t public_key[WG_KEY_LEN];
>         uint8_t preshared_key[WG_KEY_LEN];
>
> +       char *endpoint_value;
>         union {
>                 struct sockaddr addr;
>                 struct sockaddr_in addr4;
>                 struct sockaddr_in6 addr6;
>         } endpoint;
>
> +       int addr_fam;
> +
>         struct timespec64 last_handshake_time;
>         uint64_t rx_bytes, tx_bytes;
>         uint16_t persistent_keepalive_interval;
> @@ -99,6 +102,8 @@ static inline void free_wgdevice(struct wgdevice *dev)
>         for (struct wgpeer *peer =3D dev->first_peer, *np =3D peer ? peer=
->next_peer : NULL; peer; peer =3D np, np =3D peer ? peer->next_peer : NULL=
) {
>                 for (struct wgallowedip *allowedip =3D peer->first_allowe=
dip, *na =3D allowedip ? allowedip->next_allowedip : NULL; allowedip; allow=
edip =3D na, na =3D allowedip ? allowedip->next_allowedip : NULL)
>                         free(allowedip);
> +               if (peer->endpoint_value)
> +                       free(peer->endpoint_value);
>                 free(peer);
>         }
>         free(dev);
> diff --git a/src/man/wg.8 b/src/man/wg.8
> index a5d8bcf..48f084d 100644
> --- a/src/man/wg.8
> +++ b/src/man/wg.8
> @@ -55,7 +55,7 @@ transfer-rx, transfer-tx, persistent-keepalive.
>  Shows the current configuration of \fI<interface>\fP in the format descr=
ibed
>  by \fICONFIGURATION FILE FORMAT\fP below.
>  .TP
> -\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\=
fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<ba=
se64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] =
[\fIendpoint\fP \fI<ip>:<port>\fP] [\fIpersistent-keepalive\fP \fI<interval=
 seconds>\fP] [\fIallowed-ips\fP \fI<ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP].=
..] ]...
> +\fBset\fP \fI<interface>\fP [\fIlisten-port\fP \fI<port>\fP] [\fIfwmark\=
fP \fI<fwmark>\fP] [\fIprivate-key\fP \fI<file-path>\fP] [\fIpeer\fP \fI<ba=
se64-public-key>\fP [\fIremove\fP] [\fIpreshared-key\fP \fI<file-path>\fP] =
[\fIendpoint\fP \fI<ip>:<port>\fP] [\fIaddress-family\fP \fI<family>\fP] [\=
fIpersistent-keepalive\fP \fI<interval seconds>\fP] [\fIallowed-ips\fP \fI<=
ip1>/<cidr1>\fP[,\fI<ip2>/<cidr2>\fP]...] ]...
>  Sets configuration values for the specified \fI<interface>\fP. Multiple
>  \fIpeer\fPs may be specified, and if the \fIremove\fP argument is given
>  for a peer, that peer is removed, not configured. If \fIlisten-port\fP
> @@ -167,6 +167,12 @@ port number. This endpoint will be updated automatic=
ally to the most recent
>  source IP address and port of correctly authenticated packets from the p=
eer.
>  Optional.
>  .IP \(bu
> +AddressFamily \(em one of \fIinet\fP, \fIinet6\fP or \fIunspec\fP. When =
a
> +hostname is given for \fIEndpoint\fP, setting this to \fIinet\fP or
> +\fIinet6\fP will allow only addresses of the given family to be
> +used. Defaults to \fIunspec\fP, which causes the first returned address =
of
> +any type to be used.
> +.IP \(bu
>  PersistentKeepalive \(em a seconds interval, between 1 and 65535 inclusi=
ve, of
>  how often to send an authenticated empty packet to the peer for the purp=
ose of keeping a
>  stateful firewall or NAT mapping valid persistently. For example, if the=
 interface
> diff --git a/src/set.c b/src/set.c
> index 75560fd..20ee85e 100644
> --- a/src/set.c
> +++ b/src/set.c
> @@ -18,13 +18,20 @@ int set_main(int argc, const char *argv[])
>         int ret =3D 1;
>
>         if (argc < 3) {
> -               fprintf(stderr, "Usage: %s %s <interface> [listen-port <p=
ort>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [=
remove] [preshared-key <file path>] [endpoint <ip>:<port>] [persistent-keep=
alive <interval seconds>] [allowed-ips <ip1>/<cidr1>[,<ip2>/<cidr2>]...] ].=
..\n", PROG_NAME, argv[0]);
> +               fprintf(stderr, "Usage: %s %s <interface> [listen-port <p=
ort>] [fwmark <mark>] [private-key <file path>] [peer <base64 public key> [=
remove] [preshared-key <file path>] [endpoint <ip>:<port>] [address-family =
<family>] [persistent-keepalive <interval seconds>] [allowed-ips <ip1>/<cid=
r1>[,<ip2>/<cidr2>]...] ]...\n", PROG_NAME, argv[0]);
>                 return 1;
>         }
>
>         device =3D config_read_cmd(argv + 2, argc - 2);
>         if (!device)
>                 goto cleanup;
> +
> +       device =3D config_read_finish(device);
> +       if (!device) {
> +               fprintf(stderr, "Invalid configuration\n");
> +               goto cleanup;
> +       }
> +
>         strncpy(device->name, argv[1], IFNAMSIZ -  1);
>         device->name[IFNAMSIZ - 1] =3D '\0';
>
> diff --git a/src/setconf.c b/src/setconf.c
> index 1c5b138..c90fd30 100644
> --- a/src/setconf.c
> +++ b/src/setconf.c
> @@ -127,7 +127,7 @@ int setconf_main(int argc, const char *argv[])
>                         goto cleanup;
>                 }
>         }
> -       device =3D config_read_finish(&ctx);
> +       device =3D config_read_finish(ctx.device);
>         if (!device) {
>                 fprintf(stderr, "Invalid configuration\n");
>                 goto cleanup;
> --
> 2.39.2
>
>

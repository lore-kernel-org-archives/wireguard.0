Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD73FC35674
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5249B214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oliver-net-au.20150623.gappssmtp.com header.i=@oliver-net-au.20150623.gappssmtp.com header.b="RqbkjF7Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5249B214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=oliver.net.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72c32ba9;
	Sun, 23 Feb 2020 10:27:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7c3370c
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 04:45:41 +0000 (UTC)
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0816339a
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Feb 2020 04:45:41 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id n184so7358717ywc.3
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 20:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oliver-net-au.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=FKlJnbM4cSanefhsLM8jdIXuYLl782qWczx+3L0llqo=;
 b=RqbkjF7YKN2JEXUjZNVGWJhvNe4btek+hdijUHrVxE1+FjcjRvAiCXEpi9WdbJMllh
 spVX3ZlpJdxvUKXNMWcqktaUzErD4Lp6aqUgHjKOpaevPHCfEGiSLTfYiwBFAkMEPxBu
 kSoMjDEVlMP0DKi/Etvc1kK5txmVyJ/3vX/L00bzq0XOT1Kv9ND+L67HMfRQu2Y1D7Wa
 +AH8uH/PkolCUrthqKbkpi28nIcxCUMIQnCdGldbx4hEPgbSaZKUM8FH8LIVtYe+pfoY
 aTiKDDNjvNSLgGj4BD09twdXSheSrMa7w5JEBIPEw09MWnNjM8/8cUKC1BBSKkqUkpmM
 sgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=FKlJnbM4cSanefhsLM8jdIXuYLl782qWczx+3L0llqo=;
 b=gTV8E3djSDIQz1kQnWyYEK4d+nFDg+JvISdwuJX6u+leTowssRdUh4mVHQj52Dvvkf
 sPKpjiBCNFre1JNkMYncoauQJyz6yOYVKT4j63gWbzRkI9s7fid9OfTIMh1TPntMJjo7
 PTvSnGA5gX36PU+60+STqD3o2ojL1b2oQPEXv4lvsckiBpV6fCl3CA3wKwDhpMiiUZ9q
 C+PJWLsb+eijhefcvCDnMJJV8NLwCvI8gPRebaE05pqZ+XdvZ56jNEf2Pf1moCCl7nZN
 LTd+x1TO48jEeYQRZN2c+8X5/XtWGp0FaCpES1Tl2oV3PLXj6tOPNJFWhK/ZyBmhEVNV
 l62w==
X-Gm-Message-State: APjAAAVfyDfac43TL5mwYZQQhMNm5ztpT1+dBVcRK0ROXSB24GeB0spa
 xFeJ3lghrap/bUY0Q1x+HGN4O6elaP2TDXfjkD8pJkVOslg=
X-Google-Smtp-Source: APXvYqy3Nh+Ms4HavaPBPtMhpSC1ygML8o5AG286MSz3IfwzIqmo0OBRNyRTlOqXX5DAtmumOUQUkQZeQhRIZezsnyM=
X-Received: by 2002:a81:9146:: with SMTP id i67mr11515879ywg.120.1581914887834; 
 Sun, 16 Feb 2020 20:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20200217035701.28261-1-matt@oliver.net.au>
In-Reply-To: <20200217035701.28261-1-matt@oliver.net.au>
From: Matthew Oliver <matt@oliver.net.au>
Date: Mon, 17 Feb 2020 15:47:56 +1100
Message-ID: <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
Subject: Re: [PATCH] wg show: Add json output
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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
Content-Type: multipart/mixed; boundary="===============3082523125934321916=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3082523125934321916==
Content-Type: multipart/alternative; boundary="000000000000f46a83059ebe42c6"

--000000000000f46a83059ebe42c6
Content-Type: text/plain; charset="UTF-8"

Someone asked about this in the IRC channel, so quickly wrote up a patch to
add it. No pressure if you do/don't want to merge it :)

Matt

On Mon, Feb 17, 2020 at 2:57 PM Matthew Oliver <matt@oliver.net.au> wrote:

> This patch adds a new option to `wg show` called json. When
> specified it'll output the WG interface in json output.
>
> It works with both given an interface or all.
>
>   # wg show wg1 json
>   [
>     {
>       "interface": "wg1",
>       "public_key": "Yh0kKjoqnJsxbCsTkQ/3uncEhdqa+EtJXCYcVzMdugs=",
>       "private_key": "MKVTz8NCXL0uaE77MJfgIWSSy1AfqSmLFRx16oxmrmk=",
>       "port": "51831",
>       "fwmark": null,
>       "peers": [
>          {
>            "peer": "GzY59HlXkCkfXl9uSkEFTHzOtBsxQFKu3KWGFH5P9Qc=",
>            "preshared_key": null,
>            "endpoint": "172.16.3.104:51834",
>            "allowed_ips": [
>              "10.0.3.0/24", "224.0.0.0/8", "172.16.0.0/16"
>            ],
>            "latest_handshake": 1581909869,
>            "transfer": {
>             "received": 3949216,
>             "sent": 4531428
>            },
>            "persistent_keepalive": 30
>          }
>       ]
>     }
>   ]
>
> Note however, that this will print out the private key.
>
> Signed-off-by: Matthew Oliver <matt@oliver.net.au>
> ---
>  src/show.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 72 insertions(+), 3 deletions(-)
>
> diff --git a/src/show.c b/src/show.c
> index e772339..f8c7543 100644
> --- a/src/show.c
> +++ b/src/show.c
> @@ -202,7 +202,62 @@ static char *bytes(uint64_t b)
>  static const char *COMMAND_NAME;
>  static void show_usage(void)
>  {
> -       fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces }
> [public-key | private-key | listen-port | fwmark | peers | preshared-keys |
> endpoints | allowed-ips | latest-handshakes | transfer |
> persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
> +       fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces }
> [public-key | private-key | listen-port | fwmark | peers | preshared-keys |
> endpoints | allowed-ips | latest-handshakes | transfer |
> persistent-keepalive | dump | json]\n", PROG_NAME, COMMAND_NAME);
> +}
> +
> +static void json_print(struct wgdevice *device)
> +{
> +       struct wgpeer *peer;
> +       struct wgallowedip *allowedip;
> +       terminal_printf(TERMINAL_RESET);
> +       terminal_printf("  {\n");
> +       terminal_printf("    \"interface\": \"%s\",\n", device->name);
> +       terminal_printf("    \"public_key\": \"%s\",\n",
> key(device->public_key));
> +       terminal_printf("    \"private_key\": \"%s\",\n",
> key(device->private_key));
> +       terminal_printf("    \"port\": \"%d\",\n", device->listen_port);
> +       if (device->fwmark)
> +               terminal_printf("    \"fwmark\": \"0x%x\",\n",
> device->fwmark);
> +       else
> +               terminal_printf("    \"fwmark\": null,\n");
> +       terminal_printf("    \"peers\": [\n");
> +       sort_peers(device);
> +       for_each_wgpeer(device, peer) {
> +               terminal_printf("       {\n");
> +               terminal_printf("         \"peer\": \"%s\",\n",
> key(peer->public_key));
> +               if (peer->flags & WGPEER_HAS_PRESHARED_KEY)
> +                       terminal_printf("         \"preshared_key\":
> \"%s\",\n", key(peer->preshared_key));
> +               else
> +                       terminal_printf("         \"preshared_key\":
> null,\n");
> +               if (peer->endpoint.addr.sa_family == AF_INET ||
> peer->endpoint.addr.sa_family == AF_INET6)
> +                       terminal_printf("         \"endpoint\":
> \"%s\",\n", endpoint(&peer->endpoint.addr));
> +               else
> +                       terminal_printf("         \"endpoint\": null,\n");
> +               terminal_printf("         \"allowed_ips\": [\n");
> +               if (peer->first_allowedip) {
> +                       terminal_printf("           ");
> +                       for_each_wgallowedip(peer, allowedip)
> +                               terminal_printf("\"%s/%u\"%s",
> ip(allowedip), allowedip->cidr, allowedip->next_allowedip ? ", " : "\n");
> +               }
> +               terminal_printf("         ],\n");
> +               if (peer->last_handshake_time.tv_sec)
> +                       terminal_printf("         \"latest_handshake\":
> %ld,\n", peer->last_handshake_time.tv_sec);
> +               else
> +                       terminal_printf("         \"latest_handshake\":
> null,\n");
> +               terminal_printf("         \"transfer\": {\n");
> +               terminal_printf("          \"received\": %ld,\n",
> peer->rx_bytes);
> +               terminal_printf("          \"sent\": %ld\n",
> peer->tx_bytes);
> +               terminal_printf("         },\n");
> +               if (peer->persistent_keepalive_interval)
> +                       terminal_printf("
>  \"persistent_keepalive\": %d\n", peer->persistent_keepalive_interval);
> +               else
> +                       terminal_printf("
>  \"persistent_keepalive\": null\n");
> +               if (peer->next_peer)
> +                       terminal_printf("       },\n");
> +               else
> +                       terminal_printf("       }\n");
> +       }
> +       terminal_printf("    ]\n");
> +       terminal_printf("  }");
>  }
>
>  static void pretty_print(struct wgdevice *device)
> @@ -396,6 +451,8 @@ int show_main(int argc, char *argv[])
>                 }
>                 ret = !!*interfaces;
>                 interface = interfaces;
> +               if (argc == 3 && !strcmp(argv[2], "json"))
> +                       terminal_printf("[\n");
>                 for (size_t len = 0; (len = strlen(interface)); interface
> += len + 1) {
>                         struct wgdevice *device = NULL;
>
> @@ -404,7 +461,13 @@ int show_main(int argc, char *argv[])
>                                 continue;
>                         }
>                         if (argc == 3) {
> -                               if (!ugly_print(device, argv[2], true)) {
> +                               if (!strcmp(argv[2], "json")) {
> +                                       json_print(device);
> +                                       if (strlen(interface + len + 1))
> +                                               terminal_printf(",\n");
> +                                       else
> +                                               terminal_printf("\n");
> +                               } else if (!ugly_print(device, argv[2],
> true)) {
>                                         ret = 1;
>                                         free_wgdevice(device);
>                                         break;
> @@ -417,6 +480,8 @@ int show_main(int argc, char *argv[])
>                         free_wgdevice(device);
>                         ret = 0;
>                 }
> +               if (argc == 3 && !strcmp(argv[2], "json"))
> +                       terminal_printf("]\n");
>                 free(interfaces);
>         } else if (!strcmp(argv[1], "interfaces")) {
>                 char *interfaces, *interface;
> @@ -444,7 +509,11 @@ int show_main(int argc, char *argv[])
>                         return 1;
>                 }
>                 if (argc == 3) {
> -                       if (!ugly_print(device, argv[2], false))
> +                       if (!strcmp(argv[2], "json")) {
> +                               terminal_printf("[\n");
> +                               json_print(device);
> +                               terminal_printf("\n]\n");
> +                       } else if (!ugly_print(device, argv[2], false))
>                                 ret = 1;
>                 } else
>                         pretty_print(device);
> --
> 2.22.0
>
>

--000000000000f46a83059ebe42c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+U29tZW9uZSBhc2tlZCBhYm91dCB0aGlzIGluIHRoZSBJUkMgY2hhbm5l
bCwgc28gcXVpY2tseSB3cm90ZSB1cCBhIHBhdGNoIHRvIGFkZCBpdC4gTm8gcHJlc3N1cmUgaWYg
eW91IGRvL2RvbiYjMzk7dCB3YW50IHRvIG1lcmdlIGl0IDopPGRpdj48YnI+PC9kaXY+PGRpdj5N
YXR0PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRy
IiBjbGFzcz0iZ21haWxfYXR0ciI+T24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMjo1NyBQTSBNYXR0
aGV3IE9saXZlciAmbHQ7PGEgaHJlZj0ibWFpbHRvOm1hdHRAb2xpdmVyLm5ldC5hdSI+bWF0dEBv
bGl2ZXIubmV0LmF1PC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5UaGlzIHBhdGNoIGFk
ZHMgYSBuZXcgb3B0aW9uIHRvIGB3ZyBzaG93YCBjYWxsZWQganNvbi4gV2hlbjxicj4NCnNwZWNp
ZmllZCBpdCYjMzk7bGwgb3V0cHV0IHRoZSBXRyBpbnRlcmZhY2UgaW4ganNvbiBvdXRwdXQuPGJy
Pg0KPGJyPg0KSXQgd29ya3Mgd2l0aCBib3RoIGdpdmVuIGFuIGludGVyZmFjZSBvciBhbGwuPGJy
Pg0KPGJyPg0KwqAgIyB3ZyBzaG93IHdnMSBqc29uPGJyPg0KwqAgWzxicj4NCsKgIMKgIHs8YnI+
DQrCoCDCoCDCoCAmcXVvdDtpbnRlcmZhY2UmcXVvdDs6ICZxdW90O3dnMSZxdW90Oyw8YnI+DQrC
oCDCoCDCoCAmcXVvdDtwdWJsaWNfa2V5JnF1b3Q7OiAmcXVvdDtZaDBrS2pvcW5Kc3hiQ3NUa1Ev
M3VuY0VoZHFhK0V0SlhDWWNWek1kdWdzPSZxdW90Oyw8YnI+DQrCoCDCoCDCoCAmcXVvdDtwcml2
YXRlX2tleSZxdW90OzogJnF1b3Q7TUtWVHo4TkNYTDB1YUU3N01KZmdJV1NTeTFBZnFTbUxGUngx
Nm94bXJtaz0mcXVvdDssPGJyPg0KwqAgwqAgwqAgJnF1b3Q7cG9ydCZxdW90OzogJnF1b3Q7NTE4
MzEmcXVvdDssPGJyPg0KwqAgwqAgwqAgJnF1b3Q7ZndtYXJrJnF1b3Q7OiBudWxsLDxicj4NCsKg
IMKgIMKgICZxdW90O3BlZXJzJnF1b3Q7OiBbPGJyPg0KwqAgwqAgwqAgwqAgwqB7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAmcXVvdDtwZWVyJnF1b3Q7OiAmcXVvdDtHelk1OUhsWGtDa2ZYbDl1U2tF
RlRIek90QnN4UUZLdTNLV0dGSDVQOVFjPSZxdW90Oyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCZx
dW90O3ByZXNoYXJlZF9rZXkmcXVvdDs6IG51bGwsPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAmcXVv
dDtlbmRwb2ludCZxdW90OzogJnF1b3Q7PGEgaHJlZj0iaHR0cDovLzE3Mi4xNi4zLjEwNDo1MTgz
NCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTcyLjE2LjMuMTA0OjUxODM0PC9h
PiZxdW90Oyw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2FsbG93ZWRfaXBzJnF1b3Q7OiBb
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDs8YSBocmVmPSJodHRwOi8vMTAuMC4zLjAv
MjQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEwLjAuMy4wLzI0PC9hPiZxdW90
OywgJnF1b3Q7PGEgaHJlZj0iaHR0cDovLzIyNC4wLjAuMC84IiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj4yMjQuMC4wLjAvODwvYT4mcXVvdDssICZxdW90OzxhIGhyZWY9Imh0dHA6
Ly8xNzIuMTYuMC4wLzE2IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj4xNzIuMTYu
MC4wLzE2PC9hPiZxdW90Ozxicj4NCsKgIMKgIMKgIMKgIMKgIMKgXSw8YnI+DQrCoCDCoCDCoCDC
oCDCoCDCoCZxdW90O2xhdGVzdF9oYW5kc2hha2UmcXVvdDs6IDE1ODE5MDk4NjksPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAmcXVvdDt0cmFuc2ZlciZxdW90Ozogezxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgICZxdW90O3JlY2VpdmVkJnF1b3Q7OiAzOTQ5MjE2LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKg
ICZxdW90O3NlbnQmcXVvdDs6IDQ1MzE0Mjg8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoH0sPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtwZXJzaXN0ZW50X2tlZXBhbGl2ZSZxdW90OzogMzA8YnI+
DQrCoCDCoCDCoCDCoCDCoH08YnI+DQrCoCDCoCDCoCBdPGJyPg0KwqAgwqAgfTxicj4NCsKgIF08
YnI+DQo8YnI+DQpOb3RlIGhvd2V2ZXIsIHRoYXQgdGhpcyB3aWxsIHByaW50IG91dCB0aGUgcHJp
dmF0ZSBrZXkuPGJyPg0KPGJyPg0KU2lnbmVkLW9mZi1ieTogTWF0dGhldyBPbGl2ZXIgJmx0Ozxh
IGhyZWY9Im1haWx0bzptYXR0QG9saXZlci5uZXQuYXUiIHRhcmdldD0iX2JsYW5rIj5tYXR0QG9s
aXZlci5uZXQuYXU8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgc3JjL3Nob3cuYyB8IDc1ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLTxicj4NCsKg
MSBmaWxlIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pPGJyPg0KPGJy
Pg0KZGlmZiAtLWdpdCBhL3NyYy9zaG93LmMgYi9zcmMvc2hvdy5jPGJyPg0KaW5kZXggZTc3MjMz
OS4uZjhjNzU0MyAxMDA2NDQ8YnI+DQotLS0gYS9zcmMvc2hvdy5jPGJyPg0KKysrIGIvc3JjL3No
b3cuYzxicj4NCkBAIC0yMDIsNyArMjAyLDYyIEBAIHN0YXRpYyBjaGFyICpieXRlcyh1aW50NjRf
dCBiKTxicj4NCsKgc3RhdGljIGNvbnN0IGNoYXIgKkNPTU1BTkRfTkFNRTs8YnI+DQrCoHN0YXRp
YyB2b2lkIHNob3dfdXNhZ2Uodm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBmcHJpbnRm
KHN0ZGVyciwgJnF1b3Q7VXNhZ2U6ICVzICVzIHsgJmx0O2ludGVyZmFjZSZndDsgfCBhbGwgfCBp
bnRlcmZhY2VzIH0gW3B1YmxpYy1rZXkgfCBwcml2YXRlLWtleSB8IGxpc3Rlbi1wb3J0IHwgZndt
YXJrIHwgcGVlcnMgfCBwcmVzaGFyZWQta2V5cyB8IGVuZHBvaW50cyB8IGFsbG93ZWQtaXBzIHwg
bGF0ZXN0LWhhbmRzaGFrZXMgfCB0cmFuc2ZlciB8IHBlcnNpc3RlbnQta2VlcGFsaXZlIHwgZHVt
cF1cbiZxdW90OywgUFJPR19OQU1FLCBDT01NQU5EX05BTUUpOzxicj4NCivCoCDCoCDCoCDCoGZw
cmludGYoc3RkZXJyLCAmcXVvdDtVc2FnZTogJXMgJXMgeyAmbHQ7aW50ZXJmYWNlJmd0OyB8IGFs
bCB8IGludGVyZmFjZXMgfSBbcHVibGljLWtleSB8IHByaXZhdGUta2V5IHwgbGlzdGVuLXBvcnQg
fCBmd21hcmsgfCBwZWVycyB8IHByZXNoYXJlZC1rZXlzIHwgZW5kcG9pbnRzIHwgYWxsb3dlZC1p
cHMgfCBsYXRlc3QtaGFuZHNoYWtlcyB8IHRyYW5zZmVyIHwgcGVyc2lzdGVudC1rZWVwYWxpdmUg
fCBkdW1wIHwganNvbl1cbiZxdW90OywgUFJPR19OQU1FLCBDT01NQU5EX05BTUUpOzxicj4NCit9
PGJyPg0KKzxicj4NCitzdGF0aWMgdm9pZCBqc29uX3ByaW50KHN0cnVjdCB3Z2RldmljZSAqZGV2
aWNlKTxicj4NCit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHdncGVlciAqcGVlcjs8YnI+DQor
wqAgwqAgwqAgwqBzdHJ1Y3Qgd2dhbGxvd2VkaXAgKmFsbG93ZWRpcDs8YnI+DQorwqAgwqAgwqAg
wqB0ZXJtaW5hbF9wcmludGYoVEVSTUlOQUxfUkVTRVQpOzxicj4NCivCoCDCoCDCoCDCoHRlcm1p
bmFsX3ByaW50ZigmcXVvdDvCoCB7XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoHRlcm1pbmFs
X3ByaW50ZigmcXVvdDvCoCDCoCBcJnF1b3Q7aW50ZXJmYWNlXCZxdW90OzogXCZxdW90OyVzXCZx
dW90OyxcbiZxdW90OywgZGV2aWNlLSZndDtuYW1lKTs8YnI+DQorwqAgwqAgwqAgwqB0ZXJtaW5h
bF9wcmludGYoJnF1b3Q7wqAgwqAgXCZxdW90O3B1YmxpY19rZXlcJnF1b3Q7OiBcJnF1b3Q7JXNc
JnF1b3Q7LFxuJnF1b3Q7LCBrZXkoZGV2aWNlLSZndDtwdWJsaWNfa2V5KSk7PGJyPg0KK8KgIMKg
IMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVvdDtwcml2YXRlX2tleVwmcXVv
dDs6IFwmcXVvdDslc1wmcXVvdDssXG4mcXVvdDssIGtleShkZXZpY2UtJmd0O3ByaXZhdGVfa2V5
KSk7PGJyPg0KK8KgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVvdDtw
b3J0XCZxdW90OzogXCZxdW90OyVkXCZxdW90OyxcbiZxdW90OywgZGV2aWNlLSZndDtsaXN0ZW5f
cG9ydCk7PGJyPg0KK8KgIMKgIMKgIMKgaWYgKGRldmljZS0mZ3Q7ZndtYXJrKTxicj4NCivCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCBcJnF1b3Q7Zndt
YXJrXCZxdW90OzogXCZxdW90OzB4JXhcJnF1b3Q7LFxuJnF1b3Q7LCBkZXZpY2UtJmd0O2Z3bWFy
ayk7PGJyPg0KK8KgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRl
cm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCBcJnF1b3Q7ZndtYXJrXCZxdW90OzogbnVsbCxcbiZx
dW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVv
dDtwZWVyc1wmcXVvdDs6IFtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgc29ydF9wZWVycyhk
ZXZpY2UpOzxicj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX3dncGVlcihkZXZpY2UsIHBlZXIpIHs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAg
wqAgwqB7XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3By
aW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwZWVyXCZxdW90OzogXCZxdW90OyVzXCZx
dW90OyxcbiZxdW90Oywga2V5KHBlZXItJmd0O3B1YmxpY19rZXkpKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAocGVlci0mZ3Q7ZmxhZ3MgJmFtcDsgV0dQRUVSX0hBU19QUkVTSEFS
RURfS0VZKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFs
X3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwcmVzaGFyZWRfa2V5XCZxdW90Ozog
XCZxdW90OyVzXCZxdW90OyxcbiZxdW90Oywga2V5KHBlZXItJmd0O3ByZXNoYXJlZF9rZXkpKTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZx
dW90O3ByZXNoYXJlZF9rZXlcJnF1b3Q7OiBudWxsLFxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBpZiAocGVlci0mZ3Q7ZW5kcG9pbnQuYWRkci5zYV9mYW1pbHkgPT0gQUZf
SU5FVCB8fCBwZWVyLSZndDtlbmRwb2ludC5hZGRyLnNhX2ZhbWlseSA9PSBBRl9JTkVUNik8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1
b3Q7wqAgwqAgwqAgwqAgwqBcJnF1b3Q7ZW5kcG9pbnRcJnF1b3Q7OiBcJnF1b3Q7JXNcJnF1b3Q7
LFxuJnF1b3Q7LCBlbmRwb2ludCgmYW1wO3BlZXItJmd0O2VuZHBvaW50LmFkZHIpKTs8YnI+DQor
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZxdW90O2Vu
ZHBvaW50XCZxdW90OzogbnVsbCxcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZxdW90O2FsbG93ZWRfaXBz
XCZxdW90OzogW1xuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocGVl
ci0mZ3Q7Zmlyc3RfYWxsb3dlZGlwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmb3JfZWFjaF93Z2FsbG93
ZWRpcChwZWVyLCBhbGxvd2VkaXApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O1wmcXVvdDslcy8ldVwmcXVv
dDslcyZxdW90OywgaXAoYWxsb3dlZGlwKSwgYWxsb3dlZGlwLSZndDtjaWRyLCBhbGxvd2VkaXAt
Jmd0O25leHRfYWxsb3dlZGlwID8gJnF1b3Q7LCAmcXVvdDsgOiAmcXVvdDtcbiZxdW90Oyk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoF0sXG4mcXVvdDspOzxicj4NCivC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChwZWVyLSZndDtsYXN0X2hhbmRzaGFrZV90aW1lLnR2
X3NlYyk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9w
cmludGYoJnF1b3Q7wqAgwqAgwqAgwqAgwqBcJnF1b3Q7bGF0ZXN0X2hhbmRzaGFrZVwmcXVvdDs6
ICVsZCxcbiZxdW90OywgcGVlci0mZ3Q7bGFzdF9oYW5kc2hha2VfdGltZS50dl9zZWMpOzxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVsc2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgwqAgwqAgwqBcJnF1b3Q7
bGF0ZXN0X2hhbmRzaGFrZVwmcXVvdDs6IG51bGwsXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDt0
cmFuc2ZlclwmcXVvdDs6IHtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgIFwmcXVvdDtyZWNlaXZlZFwmcXVv
dDs6ICVsZCxcbiZxdW90OywgcGVlci0mZ3Q7cnhfYnl0ZXMpOzxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoCBcJnF1b3Q7c2Vu
dFwmcXVvdDs6ICVsZFxuJnF1b3Q7LCBwZWVyLSZndDt0eF9ieXRlcyk7PGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgfSxcbiZx
dW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHBlZXItJmd0O3BlcnNpc3Rl
bnRfa2VlcGFsaXZlX2ludGVydmFsKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwZXJzaXN0
ZW50X2tlZXBhbGl2ZVwmcXVvdDs6ICVkXG4mcXVvdDssIHBlZXItJmd0O3BlcnNpc3RlbnRfa2Vl
cGFsaXZlX2ludGVydmFsKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90
O8KgIMKgIMKgIMKgIMKgXCZxdW90O3BlcnNpc3RlbnRfa2VlcGFsaXZlXCZxdW90OzogbnVsbFxu
JnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocGVlci0mZ3Q7bmV4dF9w
ZWVyKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3By
aW50ZigmcXVvdDvCoCDCoCDCoCDCoH0sXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoGVsc2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJt
aW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgwqAgwqB9XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDC
oH08YnI+DQorwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgXVxuJnF1b3Q7
KTs8YnI+DQorwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgfSZxdW90Oyk7PGJy
Pg0KwqB9PGJyPg0KPGJyPg0KwqBzdGF0aWMgdm9pZCBwcmV0dHlfcHJpbnQoc3RydWN0IHdnZGV2
aWNlICpkZXZpY2UpPGJyPg0KQEAgLTM5Niw2ICs0NTEsOCBAQCBpbnQgc2hvd19tYWluKGludCBh
cmdjLCBjaGFyICphcmd2W10pPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9ICEhKmludGVyZmFjZXM7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaW50ZXJmYWNlID0gaW50ZXJmYWNlczs8YnI+DQorwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBpZiAoYXJnYyA9PSAzICZhbXA7JmFtcDsgIXN0cmNtcChhcmd2WzJdLCAmcXVv
dDtqc29uJnF1b3Q7KSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
ZXJtaW5hbF9wcmludGYoJnF1b3Q7W1xuJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBmb3IgKHNpemVfdCBsZW4gPSAwOyAobGVuID0gc3RybGVuKGludGVyZmFjZSkpOyBpbnRl
cmZhY2UgKz0gbGVuICsgMSkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHN0cnVjdCB3Z2RldmljZSAqZGV2aWNlID0gTlVMTDs8YnI+DQo8YnI+DQpAQCAtNDA0LDcg
KzQ2MSwxMyBAQCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29udGludWU7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChhcmdjID09IDMpIHs8YnI+DQotwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIXVnbHlfcHJpbnQoZGV2
aWNlLCBhcmd2WzJdLCB0cnVlKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGlmICghc3RyY21wKGFyZ3ZbMl0sICZxdW90O2pzb24mcXVvdDsp
KSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKganNvbl9wcmludChkZXZpY2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChzdHJsZW4oaW50ZXJm
YWNlICsgbGVuICsgMSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90
OyxcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3By
aW50ZigmcXVvdDtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfSBlbHNlIGlmICghdWdseV9wcmludChkZXZpY2UsIGFyZ3ZbMl0s
IHRydWUpKSB7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcmV0ID0gMTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmcmVlX3dnZGV2aWNlKGRldmljZSk7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgYnJlYWs7PGJyPg0KQEAgLTQxNyw2ICs0ODAsOCBAQCBpbnQgc2hvd19tYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgZnJlZV93Z2RldmljZShkZXZpY2UpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJldCA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChhcmdjID09IDMgJmFtcDsmYW1wOyAhc3RyY21w
KGFyZ3ZbMl0sICZxdW90O2pzb24mcXVvdDspKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDtdXG4mcXVvdDspOzxicj4NCsKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGZyZWUoaW50ZXJmYWNlcyk7PGJyPg0KwqAgwqAgwqAgwqAgfSBl
bHNlIGlmICghc3RyY21wKGFyZ3ZbMV0sICZxdW90O2ludGVyZmFjZXMmcXVvdDspKSB7PGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2hhciAqaW50ZXJmYWNlcywgKmludGVyZmFjZTs8YnI+
DQpAQCAtNDQ0LDcgKzUwOSwxMSBAQCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBjaGFyICphcmd2
W10pPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIDE7PGJy
Pg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGlmIChhcmdjID09IDMpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoIXVnbHlfcHJpbnQoZGV2aWNlLCBhcmd2WzJdLCBmYWxzZSkpPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFzdHJjbXAoYXJndlsyXSwgJnF1b3Q7anNv
biZxdW90OykpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7W1xuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBqc29uX3ByaW50KGRldmljZSk7
PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVy
bWluYWxfcHJpbnRmKCZxdW90O1xuXVxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9IGVsc2UgaWYgKCF1Z2x5X3ByaW50KGRldmljZSwgYXJndlsyXSwg
ZmFsc2UpKTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldCA9IDE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlPGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJldHR5X3ByaW50KGRldmljZSk7PGJy
Pg0KLS0gPGJyPg0KMi4yMi4wPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--000000000000f46a83059ebe42c6--

--===============3082523125934321916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3082523125934321916==--

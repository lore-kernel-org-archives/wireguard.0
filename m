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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336DAC35666
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 11:01:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA06420880
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 11:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="E5jqGBzU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA06420880
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff849939;
	Sun, 23 Feb 2020 10:57:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 355c39cf
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:57:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78291d95
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:57:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f3d6b3a
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=HkVNuciRsOgiWWDMfsvtkVYVgdQ=; b=E5jqGB
 zU+K8TWhmlMsZS7SUw94gRp/yOk2UztN0gTL+QELANk2WnPgxRWOq6xqKha00dx7
 92vmPDXtRcxY1hxBb70JqVxu+W2gU7V2JCgqZpqLDXJGTXbpbPUFehTJWglh4X9N
 K7PYmpx4MXFG7kZYJeV79hZHjJM93qB/SUgAXZ/ejk44lGL1d2JEzvQHH2kGINRQ
 fVbirqSLHvqjLkWwXNuWg2hPh/UCgNva34vGRAPigC4OIWImbsp3xrMLdk1DrNXg
 m3ADTNEBAEx6VTVz3G48EsaTV/9r0im7/sWuJpjq8hqcbQ2YoTa6Yc+eZvXaiJkd
 7ZxkjmxehY2lMtxg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 60c93fa3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:57:43 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id g64so6134609otb.13
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 03:00:59 -0800 (PST)
X-Gm-Message-State: APjAAAXo4B7KWWJjLunviZ8grEaeGQcoJCQKYo9QgT8oSiM9pCaqS1ye
 Uygq9AGj4fokLr+rDbJIhI528Dq0dtO8eJsE7Vk=
X-Google-Smtp-Source: APXvYqyiCJJYo1xK4TcIXBC9cphmW/4kk7V2d/M2S2jA+/gBHpPX6aLe0poYq6Tfb0Kf1w48SdhiUiM1KkufOx0EQ80=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr36032409otm.243.1582455658430; 
 Sun, 23 Feb 2020 03:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20200217035701.28261-1-matt@oliver.net.au>
 <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
In-Reply-To: <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 12:00:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9rob3DbpZMdU_Bh_DVjKxhzguPV1R5OvQrdBzURh7ch1g@mail.gmail.com>
Message-ID: <CAHmME9rob3DbpZMdU_Bh_DVjKxhzguPV1R5OvQrdBzURh7ch1g@mail.gmail.com>
Subject: Re: [PATCH] wg show: Add json output
To: Matthew Oliver <matt@oliver.net.au>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1243923279868876090=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1243923279868876090==
Content-Type: multipart/alternative; boundary="00000000000064c95b059f3c2b5f"

--00000000000064c95b059f3c2b5f
Content-Type: text/plain; charset="UTF-8"

wg(8) is a unix text utility.

However, we have a script in contrib for accomplishing this same thing:

https://git.zx2c4.com/wireguard-tools/tree/contrib/json

On Sun, Feb 23, 2020, 11:36 Matthew Oliver <matt@oliver.net.au> wrote:

> Someone asked about this in the IRC channel, so quickly wrote up a patch
> to add it. No pressure if you do/don't want to merge it :)
>
> Matt
>
> On Mon, Feb 17, 2020 at 2:57 PM Matthew Oliver <matt@oliver.net.au> wrote:
>
>> This patch adds a new option to `wg show` called json. When
>> specified it'll output the WG interface in json output.
>>
>> It works with both given an interface or all.
>>
>>   # wg show wg1 json
>>   [
>>     {
>>       "interface": "wg1",
>>       "public_key": "Yh0kKjoqnJsxbCsTkQ/3uncEhdqa+EtJXCYcVzMdugs=",
>>       "private_key": "MKVTz8NCXL0uaE77MJfgIWSSy1AfqSmLFRx16oxmrmk=",
>>       "port": "51831",
>>       "fwmark": null,
>>       "peers": [
>>          {
>>            "peer": "GzY59HlXkCkfXl9uSkEFTHzOtBsxQFKu3KWGFH5P9Qc=",
>>            "preshared_key": null,
>>            "endpoint": "172.16.3.104:51834",
>>            "allowed_ips": [
>>              "10.0.3.0/24", "224.0.0.0/8", "172.16.0.0/16"
>>            ],
>>            "latest_handshake": 1581909869,
>>            "transfer": {
>>             "received": 3949216,
>>             "sent": 4531428
>>            },
>>            "persistent_keepalive": 30
>>          }
>>       ]
>>     }
>>   ]
>>
>> Note however, that this will print out the private key.
>>
>> Signed-off-by: Matthew Oliver <matt@oliver.net.au>
>> ---
>>  src/show.c | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++---
>>  1 file changed, 72 insertions(+), 3 deletions(-)
>>
>> diff --git a/src/show.c b/src/show.c
>> index e772339..f8c7543 100644
>> --- a/src/show.c
>> +++ b/src/show.c
>> @@ -202,7 +202,62 @@ static char *bytes(uint64_t b)
>>  static const char *COMMAND_NAME;
>>  static void show_usage(void)
>>  {
>> -       fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces }
>> [public-key | private-key | listen-port | fwmark | peers | preshared-keys |
>> endpoints | allowed-ips | latest-handshakes | transfer |
>> persistent-keepalive | dump]\n", PROG_NAME, COMMAND_NAME);
>> +       fprintf(stderr, "Usage: %s %s { <interface> | all | interfaces }
>> [public-key | private-key | listen-port | fwmark | peers | preshared-keys |
>> endpoints | allowed-ips | latest-handshakes | transfer |
>> persistent-keepalive | dump | json]\n", PROG_NAME, COMMAND_NAME);
>> +}
>> +
>> +static void json_print(struct wgdevice *device)
>> +{
>> +       struct wgpeer *peer;
>> +       struct wgallowedip *allowedip;
>> +       terminal_printf(TERMINAL_RESET);
>> +       terminal_printf("  {\n");
>> +       terminal_printf("    \"interface\": \"%s\",\n", device->name);
>> +       terminal_printf("    \"public_key\": \"%s\",\n",
>> key(device->public_key));
>> +       terminal_printf("    \"private_key\": \"%s\",\n",
>> key(device->private_key));
>> +       terminal_printf("    \"port\": \"%d\",\n", device->listen_port);
>> +       if (device->fwmark)
>> +               terminal_printf("    \"fwmark\": \"0x%x\",\n",
>> device->fwmark);
>> +       else
>> +               terminal_printf("    \"fwmark\": null,\n");
>> +       terminal_printf("    \"peers\": [\n");
>> +       sort_peers(device);
>> +       for_each_wgpeer(device, peer) {
>> +               terminal_printf("       {\n");
>> +               terminal_printf("         \"peer\": \"%s\",\n",
>> key(peer->public_key));
>> +               if (peer->flags & WGPEER_HAS_PRESHARED_KEY)
>> +                       terminal_printf("         \"preshared_key\":
>> \"%s\",\n", key(peer->preshared_key));
>> +               else
>> +                       terminal_printf("         \"preshared_key\":
>> null,\n");
>> +               if (peer->endpoint.addr.sa_family == AF_INET ||
>> peer->endpoint.addr.sa_family == AF_INET6)
>> +                       terminal_printf("         \"endpoint\":
>> \"%s\",\n", endpoint(&peer->endpoint.addr));
>> +               else
>> +                       terminal_printf("         \"endpoint\": null,\n");
>> +               terminal_printf("         \"allowed_ips\": [\n");
>> +               if (peer->first_allowedip) {
>> +                       terminal_printf("           ");
>> +                       for_each_wgallowedip(peer, allowedip)
>> +                               terminal_printf("\"%s/%u\"%s",
>> ip(allowedip), allowedip->cidr, allowedip->next_allowedip ? ", " : "\n");
>> +               }
>> +               terminal_printf("         ],\n");
>> +               if (peer->last_handshake_time.tv_sec)
>> +                       terminal_printf("         \"latest_handshake\":
>> %ld,\n", peer->last_handshake_time.tv_sec);
>> +               else
>> +                       terminal_printf("         \"latest_handshake\":
>> null,\n");
>> +               terminal_printf("         \"transfer\": {\n");
>> +               terminal_printf("          \"received\": %ld,\n",
>> peer->rx_bytes);
>> +               terminal_printf("          \"sent\": %ld\n",
>> peer->tx_bytes);
>> +               terminal_printf("         },\n");
>> +               if (peer->persistent_keepalive_interval)
>> +                       terminal_printf("
>>  \"persistent_keepalive\": %d\n", peer->persistent_keepalive_interval);
>> +               else
>> +                       terminal_printf("
>>  \"persistent_keepalive\": null\n");
>> +               if (peer->next_peer)
>> +                       terminal_printf("       },\n");
>> +               else
>> +                       terminal_printf("       }\n");
>> +       }
>> +       terminal_printf("    ]\n");
>> +       terminal_printf("  }");
>>  }
>>
>>  static void pretty_print(struct wgdevice *device)
>> @@ -396,6 +451,8 @@ int show_main(int argc, char *argv[])
>>                 }
>>                 ret = !!*interfaces;
>>                 interface = interfaces;
>> +               if (argc == 3 && !strcmp(argv[2], "json"))
>> +                       terminal_printf("[\n");
>>                 for (size_t len = 0; (len = strlen(interface)); interface
>> += len + 1) {
>>                         struct wgdevice *device = NULL;
>>
>> @@ -404,7 +461,13 @@ int show_main(int argc, char *argv[])
>>                                 continue;
>>                         }
>>                         if (argc == 3) {
>> -                               if (!ugly_print(device, argv[2], true)) {
>> +                               if (!strcmp(argv[2], "json")) {
>> +                                       json_print(device);
>> +                                       if (strlen(interface + len + 1))
>> +                                               terminal_printf(",\n");
>> +                                       else
>> +                                               terminal_printf("\n");
>> +                               } else if (!ugly_print(device, argv[2],
>> true)) {
>>                                         ret = 1;
>>                                         free_wgdevice(device);
>>                                         break;
>> @@ -417,6 +480,8 @@ int show_main(int argc, char *argv[])
>>                         free_wgdevice(device);
>>                         ret = 0;
>>                 }
>> +               if (argc == 3 && !strcmp(argv[2], "json"))
>> +                       terminal_printf("]\n");
>>                 free(interfaces);
>>         } else if (!strcmp(argv[1], "interfaces")) {
>>                 char *interfaces, *interface;
>> @@ -444,7 +509,11 @@ int show_main(int argc, char *argv[])
>>                         return 1;
>>                 }
>>                 if (argc == 3) {
>> -                       if (!ugly_print(device, argv[2], false))
>> +                       if (!strcmp(argv[2], "json")) {
>> +                               terminal_printf("[\n");
>> +                               json_print(device);
>> +                               terminal_printf("\n]\n");
>> +                       } else if (!ugly_print(device, argv[2], false))
>>                                 ret = 1;
>>                 } else
>>                         pretty_print(device);
>> --
>> 2.22.0
>>
>> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000064c95b059f3c2b5f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPndnKDgpIGlzIGEgdW5peCB0ZXh0IHV0aWxpdHkuPGRpdiBkaXI9ImF1
dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0iYXV0byI+SG93ZXZlciwgd2UgaGF2ZSBhIHNjcmlwdCBp
biBjb250cmliIGZvciBhY2NvbXBsaXNoaW5nIHRoaXMgc2FtZSB0aGluZzo8L2Rpdj48ZGl2IGRp
cj0iYXV0byI+PGJyPjwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YSBocmVmPSJodHRwczovL2dpdC56
eDJjNC5jb20vd2lyZWd1YXJkLXRvb2xzL3RyZWUvY29udHJpYi9qc29uIj5odHRwczovL2dpdC56
eDJjNC5jb20vd2lyZWd1YXJkLXRvb2xzL3RyZWUvY29udHJpYi9qc29uPC9hPjxicj48L2Rpdj48
L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYgZGlyPSJsdHIiIGNsYXNzPSJn
bWFpbF9hdHRyIj5PbiBTdW4sIEZlYiAyMywgMjAyMCwgMTE6MzYgTWF0dGhldyBPbGl2ZXIgJmx0
OzxhIGhyZWY9Im1haWx0bzptYXR0QG9saXZlci5uZXQuYXUiPm1hdHRAb2xpdmVyLm5ldC5hdTwv
YT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5n
LWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj5Tb21lb25lIGFza2VkIGFib3V0IHRoaXMgaW4gdGhl
IElSQyBjaGFubmVsLCBzbyBxdWlja2x5IHdyb3RlIHVwIGEgcGF0Y2ggdG8gYWRkIGl0LiBObyBw
cmVzc3VyZSBpZiB5b3UgZG8vZG9uJiMzOTt0IHdhbnQgdG8gbWVyZ2UgaXQgOik8ZGl2Pjxicj48
L2Rpdj48ZGl2Pk1hdHQ8L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxk
aXYgZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBNb24sIEZlYiAxNywgMjAyMCBhdCAy
OjU3IFBNIE1hdHRoZXcgT2xpdmVyICZsdDs8YSBocmVmPSJtYWlsdG86bWF0dEBvbGl2ZXIubmV0
LmF1IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5tYXR0QG9saXZlci5uZXQuYXU8
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPlRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBvcHRp
b24gdG8gYHdnIHNob3dgIGNhbGxlZCBqc29uLiBXaGVuPGJyPg0Kc3BlY2lmaWVkIGl0JiMzOTts
bCBvdXRwdXQgdGhlIFdHIGludGVyZmFjZSBpbiBqc29uIG91dHB1dC48YnI+DQo8YnI+DQpJdCB3
b3JrcyB3aXRoIGJvdGggZ2l2ZW4gYW4gaW50ZXJmYWNlIG9yIGFsbC48YnI+DQo8YnI+DQrCoCAj
IHdnIHNob3cgd2cxIGpzb248YnI+DQrCoCBbPGJyPg0KwqAgwqAgezxicj4NCsKgIMKgIMKgICZx
dW90O2ludGVyZmFjZSZxdW90OzogJnF1b3Q7d2cxJnF1b3Q7LDxicj4NCsKgIMKgIMKgICZxdW90
O3B1YmxpY19rZXkmcXVvdDs6ICZxdW90O1loMGtLam9xbkpzeGJDc1RrUS8zdW5jRWhkcWErRXRK
WENZY1Z6TWR1Z3M9JnF1b3Q7LDxicj4NCsKgIMKgIMKgICZxdW90O3ByaXZhdGVfa2V5JnF1b3Q7
OiAmcXVvdDtNS1ZUejhOQ1hMMHVhRTc3TUpmZ0lXU1N5MUFmcVNtTEZSeDE2b3htcm1rPSZxdW90
Oyw8YnI+DQrCoCDCoCDCoCAmcXVvdDtwb3J0JnF1b3Q7OiAmcXVvdDs1MTgzMSZxdW90Oyw8YnI+
DQrCoCDCoCDCoCAmcXVvdDtmd21hcmsmcXVvdDs6IG51bGwsPGJyPg0KwqAgwqAgwqAgJnF1b3Q7
cGVlcnMmcXVvdDs6IFs8YnI+DQrCoCDCoCDCoCDCoCDCoHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDC
oCZxdW90O3BlZXImcXVvdDs6ICZxdW90O0d6WTU5SGxYa0NrZlhsOXVTa0VGVEh6T3RCc3hRRkt1
M0tXR0ZINVA5UWM9JnF1b3Q7LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cHJlc2hhcmVk
X2tleSZxdW90OzogbnVsbCw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCZxdW90O2VuZHBvaW50JnF1
b3Q7OiAmcXVvdDs8YSBocmVmPSJodHRwOi8vMTcyLjE2LjMuMTA0OjUxODM0IiByZWw9Im5vcmVm
ZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjE3Mi4xNi4zLjEwNDo1MTgzNDwvYT4m
cXVvdDssPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDthbGxvd2VkX2lwcyZxdW90OzogWzxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7PGEgaHJlZj0iaHR0cDovLzEwLjAuMy4wLzI0
IiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjEwLjAuMy4wLzI0
PC9hPiZxdW90OywgJnF1b3Q7PGEgaHJlZj0iaHR0cDovLzIyNC4wLjAuMC84IiByZWw9Im5vcmVm
ZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPjIyNC4wLjAuMC84PC9hPiZxdW90Oywg
JnF1b3Q7PGEgaHJlZj0iaHR0cDovLzE3Mi4xNi4wLjAvMTYiIHJlbD0ibm9yZWZlcnJlciBub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+MTcyLjE2LjAuMC8xNjwvYT4mcXVvdDs8YnI+DQrCoCDC
oCDCoCDCoCDCoCDCoF0sPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDtsYXRlc3RfaGFuZHNo
YWtlJnF1b3Q7OiAxNTgxOTA5ODY5LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7dHJhbnNm
ZXImcXVvdDs6IHs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtyZWNlaXZlZCZxdW90Ozog
Mzk0OTIxNiw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCAmcXVvdDtzZW50JnF1b3Q7OiA0NTMxNDI4
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqB9LDxicj4NCsKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7cGVy
c2lzdGVudF9rZWVwYWxpdmUmcXVvdDs6IDMwPGJyPg0KwqAgwqAgwqAgwqAgwqB9PGJyPg0KwqAg
wqAgwqAgXTxicj4NCsKgIMKgIH08YnI+DQrCoCBdPGJyPg0KPGJyPg0KTm90ZSBob3dldmVyLCB0
aGF0IHRoaXMgd2lsbCBwcmludCBvdXQgdGhlIHByaXZhdGUga2V5Ljxicj4NCjxicj4NClNpZ25l
ZC1vZmYtYnk6IE1hdHRoZXcgT2xpdmVyICZsdDs8YSBocmVmPSJtYWlsdG86bWF0dEBvbGl2ZXIu
bmV0LmF1IiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5tYXR0QG9saXZlci5uZXQu
YXU8L2E+Jmd0Ozxicj4NCi0tLTxicj4NCsKgc3JjL3Nob3cuYyB8IDc1ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLTxicj4NCsKgMSBmaWxlIGNo
YW5nZWQsIDcyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pPGJyPg0KPGJyPg0KZGlmZiAt
LWdpdCBhL3NyYy9zaG93LmMgYi9zcmMvc2hvdy5jPGJyPg0KaW5kZXggZTc3MjMzOS4uZjhjNzU0
MyAxMDA2NDQ8YnI+DQotLS0gYS9zcmMvc2hvdy5jPGJyPg0KKysrIGIvc3JjL3Nob3cuYzxicj4N
CkBAIC0yMDIsNyArMjAyLDYyIEBAIHN0YXRpYyBjaGFyICpieXRlcyh1aW50NjRfdCBiKTxicj4N
CsKgc3RhdGljIGNvbnN0IGNoYXIgKkNPTU1BTkRfTkFNRTs8YnI+DQrCoHN0YXRpYyB2b2lkIHNo
b3dfdXNhZ2Uodm9pZCk8YnI+DQrCoHs8YnI+DQotwqAgwqAgwqAgwqBmcHJpbnRmKHN0ZGVyciwg
JnF1b3Q7VXNhZ2U6ICVzICVzIHsgJmx0O2ludGVyZmFjZSZndDsgfCBhbGwgfCBpbnRlcmZhY2Vz
IH0gW3B1YmxpYy1rZXkgfCBwcml2YXRlLWtleSB8IGxpc3Rlbi1wb3J0IHwgZndtYXJrIHwgcGVl
cnMgfCBwcmVzaGFyZWQta2V5cyB8IGVuZHBvaW50cyB8IGFsbG93ZWQtaXBzIHwgbGF0ZXN0LWhh
bmRzaGFrZXMgfCB0cmFuc2ZlciB8IHBlcnNpc3RlbnQta2VlcGFsaXZlIHwgZHVtcF1cbiZxdW90
OywgUFJPR19OQU1FLCBDT01NQU5EX05BTUUpOzxicj4NCivCoCDCoCDCoCDCoGZwcmludGYoc3Rk
ZXJyLCAmcXVvdDtVc2FnZTogJXMgJXMgeyAmbHQ7aW50ZXJmYWNlJmd0OyB8IGFsbCB8IGludGVy
ZmFjZXMgfSBbcHVibGljLWtleSB8IHByaXZhdGUta2V5IHwgbGlzdGVuLXBvcnQgfCBmd21hcmsg
fCBwZWVycyB8IHByZXNoYXJlZC1rZXlzIHwgZW5kcG9pbnRzIHwgYWxsb3dlZC1pcHMgfCBsYXRl
c3QtaGFuZHNoYWtlcyB8IHRyYW5zZmVyIHwgcGVyc2lzdGVudC1rZWVwYWxpdmUgfCBkdW1wIHwg
anNvbl1cbiZxdW90OywgUFJPR19OQU1FLCBDT01NQU5EX05BTUUpOzxicj4NCit9PGJyPg0KKzxi
cj4NCitzdGF0aWMgdm9pZCBqc29uX3ByaW50KHN0cnVjdCB3Z2RldmljZSAqZGV2aWNlKTxicj4N
Cit7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHdncGVlciAqcGVlcjs8YnI+DQorwqAgwqAgwqAg
wqBzdHJ1Y3Qgd2dhbGxvd2VkaXAgKmFsbG93ZWRpcDs8YnI+DQorwqAgwqAgwqAgwqB0ZXJtaW5h
bF9wcmludGYoVEVSTUlOQUxfUkVTRVQpOzxicj4NCivCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50
ZigmcXVvdDvCoCB7XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50Zigm
cXVvdDvCoCDCoCBcJnF1b3Q7aW50ZXJmYWNlXCZxdW90OzogXCZxdW90OyVzXCZxdW90OyxcbiZx
dW90OywgZGV2aWNlLSZndDtuYW1lKTs8YnI+DQorwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYo
JnF1b3Q7wqAgwqAgXCZxdW90O3B1YmxpY19rZXlcJnF1b3Q7OiBcJnF1b3Q7JXNcJnF1b3Q7LFxu
JnF1b3Q7LCBrZXkoZGV2aWNlLSZndDtwdWJsaWNfa2V5KSk7PGJyPg0KK8KgIMKgIMKgIMKgdGVy
bWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVvdDtwcml2YXRlX2tleVwmcXVvdDs6IFwmcXVv
dDslc1wmcXVvdDssXG4mcXVvdDssIGtleShkZXZpY2UtJmd0O3ByaXZhdGVfa2V5KSk7PGJyPg0K
K8KgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVvdDtwb3J0XCZxdW90
OzogXCZxdW90OyVkXCZxdW90OyxcbiZxdW90OywgZGV2aWNlLSZndDtsaXN0ZW5fcG9ydCk7PGJy
Pg0KK8KgIMKgIMKgIMKgaWYgKGRldmljZS0mZ3Q7ZndtYXJrKTxicj4NCivCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCBcJnF1b3Q7ZndtYXJrXCZxdW90
OzogXCZxdW90OzB4JXhcJnF1b3Q7LFxuJnF1b3Q7LCBkZXZpY2UtJmd0O2Z3bWFyayk7PGJyPg0K
K8KgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3By
aW50ZigmcXVvdDvCoCDCoCBcJnF1b3Q7ZndtYXJrXCZxdW90OzogbnVsbCxcbiZxdW90Oyk7PGJy
Pg0KK8KgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIFwmcXVvdDtwZWVyc1wm
cXVvdDs6IFtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgc29ydF9wZWVycyhkZXZpY2UpOzxi
cj4NCivCoCDCoCDCoCDCoGZvcl9lYWNoX3dncGVlcihkZXZpY2UsIHBlZXIpIHs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgwqAgwqB7XG4m
cXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVv
dDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwZWVyXCZxdW90OzogXCZxdW90OyVzXCZxdW90OyxcbiZx
dW90Oywga2V5KHBlZXItJmd0O3B1YmxpY19rZXkpKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAocGVlci0mZ3Q7ZmxhZ3MgJmFtcDsgV0dQRUVSX0hBU19QUkVTSEFSRURfS0VZKTxi
cj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50Zigm
cXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwcmVzaGFyZWRfa2V5XCZxdW90OzogXCZxdW90OyVz
XCZxdW90OyxcbiZxdW90Oywga2V5KHBlZXItJmd0O3ByZXNoYXJlZF9rZXkpKTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZxdW90O3ByZXNo
YXJlZF9rZXlcJnF1b3Q7OiBudWxsLFxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAocGVlci0mZ3Q7ZW5kcG9pbnQuYWRkci5zYV9mYW1pbHkgPT0gQUZfSU5FVCB8fCBw
ZWVyLSZndDtlbmRwb2ludC5hZGRyLnNhX2ZhbWlseSA9PSBBRl9JTkVUNik8YnI+DQorwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAg
wqAgwqAgwqBcJnF1b3Q7ZW5kcG9pbnRcJnF1b3Q7OiBcJnF1b3Q7JXNcJnF1b3Q7LFxuJnF1b3Q7
LCBlbmRwb2ludCgmYW1wO3BlZXItJmd0O2VuZHBvaW50LmFkZHIpKTs8YnI+DQorwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZxdW90O2VuZHBvaW50XCZx
dW90OzogbnVsbCxcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWlu
YWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgXCZxdW90O2FsbG93ZWRfaXBzXCZxdW90Ozog
W1xuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocGVlci0mZ3Q7Zmly
c3RfYWxsb3dlZGlwKSB7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
dGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7KTs8YnI+DQorwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmb3JfZWFjaF93Z2FsbG93ZWRpcChwZWVy
LCBhbGxvd2VkaXApPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O1wmcXVvdDslcy8ldVwmcXVvdDslcyZxdW90
OywgaXAoYWxsb3dlZGlwKSwgYWxsb3dlZGlwLSZndDtjaWRyLCBhbGxvd2VkaXAtJmd0O25leHRf
YWxsb3dlZGlwID8gJnF1b3Q7LCAmcXVvdDsgOiAmcXVvdDtcbiZxdW90Oyk7PGJyPg0KK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFs
X3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoF0sXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGlmIChwZWVyLSZndDtsYXN0X2hhbmRzaGFrZV90aW1lLnR2X3NlYyk8YnI+
DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1
b3Q7wqAgwqAgwqAgwqAgwqBcJnF1b3Q7bGF0ZXN0X2hhbmRzaGFrZVwmcXVvdDs6ICVsZCxcbiZx
dW90OywgcGVlci0mZ3Q7bGFzdF9oYW5kc2hha2VfdGltZS50dl9zZWMpOzxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGVsc2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgwqAgwqAgwqBcJnF1b3Q7bGF0ZXN0X2hh
bmRzaGFrZVwmcXVvdDs6IG51bGwsXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDt0cmFuc2Zlclwm
cXVvdDs6IHtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxf
cHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgIFwmcXVvdDtyZWNlaXZlZFwmcXVvdDs6ICVsZCxc
biZxdW90OywgcGVlci0mZ3Q7cnhfYnl0ZXMpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHRlcm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoCBcJnF1b3Q7c2VudFwmcXVvdDs6
ICVsZFxuJnF1b3Q7LCBwZWVyLSZndDt0eF9ieXRlcyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKgIMKgIMKgfSxcbiZxdW90Oyk7PGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKHBlZXItJmd0O3BlcnNpc3RlbnRfa2VlcGFs
aXZlX2ludGVydmFsKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRl
cm1pbmFsX3ByaW50ZigmcXVvdDvCoCDCoCDCoCDCoCDCoFwmcXVvdDtwZXJzaXN0ZW50X2tlZXBh
bGl2ZVwmcXVvdDs6ICVkXG4mcXVvdDssIHBlZXItJmd0O3BlcnNpc3RlbnRfa2VlcGFsaXZlX2lu
dGVydmFsKTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlPGJyPg0KK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90O8KgIMKgIMKg
IMKgIMKgXCZxdW90O3BlcnNpc3RlbnRfa2VlcGFsaXZlXCZxdW90OzogbnVsbFxuJnF1b3Q7KTs8
YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAocGVlci0mZ3Q7bmV4dF9wZWVyKTxicj4N
CivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVv
dDvCoCDCoCDCoCDCoH0sXG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGVs
c2U8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmlu
dGYoJnF1b3Q7wqAgwqAgwqAgwqB9XG4mcXVvdDspOzxicj4NCivCoCDCoCDCoCDCoH08YnI+DQor
wqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgwqAgXVxuJnF1b3Q7KTs8YnI+DQor
wqAgwqAgwqAgwqB0ZXJtaW5hbF9wcmludGYoJnF1b3Q7wqAgfSZxdW90Oyk7PGJyPg0KwqB9PGJy
Pg0KPGJyPg0KwqBzdGF0aWMgdm9pZCBwcmV0dHlfcHJpbnQoc3RydWN0IHdnZGV2aWNlICpkZXZp
Y2UpPGJyPg0KQEAgLTM5Niw2ICs0NTEsOCBAQCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBjaGFy
ICphcmd2W10pPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHJldCA9ICEhKmludGVyZmFjZXM7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgaW50ZXJmYWNlID0gaW50ZXJmYWNlczs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoYXJnYyA9PSAzICZhbXA7JmFtcDsgIXN0cmNtcChhcmd2WzJdLCAmcXVvdDtqc29uJnF1
b3Q7KSk8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0ZXJtaW5hbF9w
cmludGYoJnF1b3Q7W1xuJnF1b3Q7KTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmb3Ig
KHNpemVfdCBsZW4gPSAwOyAobGVuID0gc3RybGVuKGludGVyZmFjZSkpOyBpbnRlcmZhY2UgKz0g
bGVuICsgMSkgezxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHN0cnVj
dCB3Z2RldmljZSAqZGV2aWNlID0gTlVMTDs8YnI+DQo8YnI+DQpAQCAtNDA0LDcgKzQ2MSwxMyBA
QCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgY29udGludWU7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGlmIChhcmdjID09IDMpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIXVnbHlfcHJpbnQoZGV2aWNlLCBhcmd2
WzJdLCB0cnVlKSkgezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGlmICghc3RyY21wKGFyZ3ZbMl0sICZxdW90O2pzb24mcXVvdDspKSB7PGJyPg0K
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKganNvbl9wcmludChkZXZpY2UpOzxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChzdHJsZW4oaW50ZXJmYWNlICsgbGVu
ICsgMSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJpbnRmKCZxdW90OyxcbiZxdW90
Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZWxzZTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHRlcm1pbmFsX3ByaW50ZigmcXVv
dDtcbiZxdW90Oyk7PGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfSBlbHNlIGlmICghdWdseV9wcmludChkZXZpY2UsIGFyZ3ZbMl0sIHRydWUpKSB7
PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgcmV0ID0gMTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmcmVlX3dnZGV2aWNlKGRldmljZSk7PGJyPg0KwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
YnJlYWs7PGJyPg0KQEAgLTQxNyw2ICs0ODAsOCBAQCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZnJl
ZV93Z2RldmljZShkZXZpY2UpOzxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldCA9IDA7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCivCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGlmIChhcmdjID09IDMgJmFtcDsmYW1wOyAhc3RyY21wKGFyZ3ZbMl0s
ICZxdW90O2pzb24mcXVvdDspKTxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHRlcm1pbmFsX3ByaW50ZigmcXVvdDtdXG4mcXVvdDspOzxicj4NCsKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGZyZWUoaW50ZXJmYWNlcyk7PGJyPg0KwqAgwqAgwqAgwqAgfSBlbHNlIGlmICgh
c3RyY21wKGFyZ3ZbMV0sICZxdW90O2ludGVyZmFjZXMmcXVvdDspKSB7PGJyPg0KwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgY2hhciAqaW50ZXJmYWNlcywgKmludGVyZmFjZTs8YnI+DQpAQCAtNDQ0
LDcgKzUwOSwxMSBAQCBpbnQgc2hvd19tYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pPGJyPg0K
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIDE7PGJyPg0KwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChhcmdj
ID09IDMpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoIXVn
bHlfcHJpbnQoZGV2aWNlLCBhcmd2WzJdLCBmYWxzZSkpPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFzdHJjbXAoYXJndlsyXSwgJnF1b3Q7anNvbiZxdW90Oykp
IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB0
ZXJtaW5hbF9wcmludGYoJnF1b3Q7W1xuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBqc29uX3ByaW50KGRldmljZSk7PGJyPg0KK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgdGVybWluYWxfcHJp
bnRmKCZxdW90O1xuXVxuJnF1b3Q7KTs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqB9IGVsc2UgaWYgKCF1Z2x5X3ByaW50KGRldmljZSwgYXJndlsyXSwgZmFsc2UpKTxi
cj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldCA9
IDE7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlPGJyPg0KwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHJldHR5X3ByaW50KGRldmljZSk7PGJyPg0KLS0gPGJy
Pg0KMi4yMi4wPGJyPg0KPGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX188YnI+DQpXaXJlR3VhcmQgbWFpbGluZyBs
aXN0PGJyPg0KPGEgaHJlZj0ibWFpbHRvOldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20iIHRhcmdl
dD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb208L2E+
PGJyPg0KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93
aXJlZ3VhcmQiIHJlbD0ibm9yZWZlcnJlciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0
cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQ8L2E+PGJyPg0K
PC9ibG9ja3F1b3RlPjwvZGl2Pg0K
--00000000000064c95b059f3c2b5f--

--===============1243923279868876090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1243923279868876090==--

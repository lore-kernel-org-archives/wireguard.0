Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 818b97f6
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 09:17:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56a14fb9
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 09:17:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c52f9075
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 09:17:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a548ae4a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 09:17:05 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id w197so25884773oif.6
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 02:19:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <462fb5c1-0832-a394-8839-d9b54bcb13fa@thalheim.io>
References: <462fb5c1-0832-a394-8839-d9b54bcb13fa@thalheim.io>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Oct 2017 10:19:23 +0100
Message-ID: <CAHmME9pQuq2ntj-yUi9PnqzzzPpLKq=bW9U2DDUTtmvT=5GH0Q@mail.gmail.com>
Subject: Re: [PATCH] wg: correct type for CTRL_ATTR_FAMILY_ID
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@thalheim.io>
Content-Type: text/plain; charset="UTF-8"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey J=C3=B3rg,

Thanks for the patch. This seems correct to me. From net/netlink/genetlink.=
c:

static const struct nla_policy ctrl_policy[CTRL_ATTR_MAX+1] =3D {
       [CTRL_ATTR_FAMILY_ID]   =3D { .type =3D NLA_U16 },

So I'll apply it.

However, the reason it was like this is because I lifted most of that
file from iproute2:
https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git/tre=
e/devlink/mnlg.c

I suspect the reason it's like this is because the original intention
was to use the same field for CTRL_ATTR_MCAST_GRP_ID, which eventually
got made into struct group_info instead.

Can you send this upstream too? You'll want to send it to
jiri@mellanox.com, stephen@networkplumber.org, and
netdev@vger.kernel.org, and put me in the CC.

Thanks,
Jason

On Tue, Oct 31, 2017 at 9:55 AM, J=C3=B6rg Thalheim <joerg@thalheim.io> wro=
te:
> Signed-off-by: Joerg Thalheim <joerg@thalheim.io>
> ---
>  src/tools/mnlg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/src/tools/mnlg.c b/src/tools/mnlg.c
> index 9135651..5ac72e2 100644
> --- a/src/tools/mnlg.c
> +++ b/src/tools/mnlg.c
> @@ -19,7 +19,7 @@
>  struct mnlg_socket {
>         struct mnl_socket *nl;
>         char *buf;
> -       uint32_t id;
> +       uint16_t id;
>         uint8_t version;
>         unsigned int seq;
>         unsigned int portid;
> @@ -206,7 +206,7 @@ int mnlg_socket_group_add(struct mnlg_socket *nlg, co=
nst char *group_name)
>         nlh =3D __mnlg_msg_prepare(nlg, CTRL_CMD_GETFAMILY,
>                                  NLM_F_REQUEST | NLM_F_ACK, GENL_ID_CTRL,=
 1);
> -       mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, nlg->id);
> +       mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, nlg->id);
>         err =3D mnlg_socket_send(nlg, nlh);
>         if (err < 0)
> --
> 2.14.3
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35d19fdd
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 08:57:51 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a4246c2
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 08:57:50 +0000 (UTC)
Received: from [IPv6:2001:608:a01:2:3602:86ff:fe1a:7b47] (unknown
 [IPv6:2001:608:a01:2:3602:86ff:fe1a:7b47])
 by mail.thalheim.io (Postfix) with ESMTPSA id 4CD0D672E7
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 09:00:09 +0000 (UTC)
Subject: Re: [PATCH] wg: correct type for CTRL_ATTR_FAMILY_ID
To: wireguard@lists.zx2c4.com
References: <462fb5c1-0832-a394-8839-d9b54bcb13fa@thalheim.io>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <77ff13e2-e375-c8d2-6ef2-8a18e5ff5577@higgsboson.tk>
Date: Tue, 31 Oct 2017 09:00:03 +0000
MIME-Version: 1.0
In-Reply-To: <462fb5c1-0832-a394-8839-d9b54bcb13fa@thalheim.io>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

sorry for the duplicate messages. I had to resend this patch due wrong sender address and the resend dialog was a bit confusing.

On 2017-10-31 08:55, Jörg Thalheim wrote:
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
>  	struct mnl_socket *nl;
>  	char *buf;
> -	uint32_t id;
> +	uint16_t id;
>  	uint8_t version;
>  	unsigned int seq;
>  	unsigned int portid;
> @@ -206,7 +206,7 @@ int mnlg_socket_group_add(struct mnlg_socket *nlg, const char *group_name)
>   	nlh = __mnlg_msg_prepare(nlg, CTRL_CMD_GETFAMILY,
>  				 NLM_F_REQUEST | NLM_F_ACK, GENL_ID_CTRL, 1);
> -	mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, nlg->id);
> +	mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, nlg->id);
>   	err = mnlg_socket_send(nlg, nlh);
>  	if (err < 0)

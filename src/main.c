/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: conoel <conoel@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/01 12:35:29 by conoel            #+#    #+#             */
/*   Updated: 2019/05/01 20:15:30 by conoel           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_select.h"

int		main(int argc, char **argv)
{
	t_term 	term;
	char **args;


	if (!init_term(&term))
		return (0);
	args = copy_tabl(argc + 1, argv);
	args = realloc_tabl_remove_index(args, 0);
	read_key(args);
	tcsetattr(term.fd, 0, &(term.term_mem));
}